rspec-map
===============

Find out which tests covers the code you want to refactor.
Usage
---

rspec-map uses forks to map out your test suite coverage. You need to add proper hooks to your spec_helper.rb. For a rails project, this would look like:
```
RspecMap.before_fork do
  ActiveRecord::Base.connection_pool.disconnect!
end

RspecMap.after_fork do
  ActiveRecord::Base.establish_connection(
    Rails.application.config.database_configuration[Rails.env]
  )
end
```

To map out your specs
```
rspec-map
```

Installing
---
No surprises:
```
gem install rspec-map
```

Or in your Gemfile
```
gem 'rspec-map'
```


