Gem::Specification.new do |gem|
  gem.name        = 'rspec-map'
  gem.version     = '0.0.0'
  gem.licenses    = ['MIT']
  gem.summary     = "Find what specs cover your code"
  gem.description = "rspec-map makes safe refactoring easier by showing you which specs cover the code you're editing."
  gem.authors     = ["Victor Mours"]
  gem.email       = 'victor.mours@gmail.com'
  gem.files       = Dir["lib/**/*.rb"]
  gem.executables = ["rspec-map"]
  gem.homepage    = 'https://github.com/victormours/rspec-map'

  gem.add_runtime_dependency "rspec"

  gem.add_development_dependency "minitest"
  gem.add_development_dependency "pry"
end
