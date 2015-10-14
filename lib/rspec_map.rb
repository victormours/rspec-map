require "coverage.so"
require 'rspec'

class RspecMap

  def self.map(rspec_args)
    require "#{Dir.pwd}/spec/spec_helper"
    configure_rspec

    RSpec::Core::Runner.run(rspec_args, STDERR, STDOUT)
  end

  def self.before_fork(&block)
    @before_fork = block
  end

  def self.after_fork(&block)
    @after_fork = block
  end

  def self.call_before_fork_hook
    @before_fork.call
  end

  def self.call_after_fork_hook
    @after_fork.call
  end

  private

  def self.configure_rspec
    RSpec.configure do |config|

      config.around(:example) do |example|

        RspecMap.call_before_fork_hook

        pid = fork do
          RspecMap.call_after_fork_hook

          Coverage.start
          example.call
          coverage =  Coverage.result
          pwd = Dir.pwd
          project_files = coverage.keys.select do |filename|
            filename.start_with?(pwd)
          end.reject do |filename|
            filename.start_with?("#{pwd}/spec")
          end
          require 'pry'; binding.pry;
        end
        Process.wait(pid)

      end
    end
  end

end
