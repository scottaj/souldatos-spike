source :rubygems

# Server requirements
# gem 'thin' # or mongrel
# gem 'trinidad', :platform => 'jruby'

# Project requirements
gem 'rake'
gem 'sinatra-flash', :require => 'sinatra/flash'

# Component requirements
gem 'slim'
gem 'activerecord', :require => "active_record"
gem 'sqlite3'
gem 'thin'
gem 'rinruby'

# Test requirements
group :test do
  gem 'rspec', :group => "test"
  gem 'capybara', :group => "test"
  gem 'cucumber', :group => "test"
  gem 'rack-test', :require => "rack/test", :group => "test"
end

group :development do
  gem 'pry'
end
  
# Padrino Stable Gem
gem 'padrino', '0.10.7'

# Or Padrino Edge
# gem 'padrino', :git => 'git://github.com/padrino/padrino-framework.git'

# Or Individual Gems
# %w(core gen helpers cache mailer admin).each do |g|
#   gem 'padrino-' + g, '0.10.7'
# end
