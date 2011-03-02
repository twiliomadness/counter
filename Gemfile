
source :rubygems

gem 'rails', '3.0.4'

# gem 'mysql'
gem 'pg'

gem 'compass'
gem 'devise', :git => 'https://github.com/plataformatec/devise.git'
gem 'haml-rails'
gem 'html5-boilerplate'
gem 'twiliolib'
# gem 'rack-ssl', :require => 'rack/ssl'

gem 'awesome_print'
gem 'looksee'
gem 'wirble'

group :development do
  gem 'hpricot'
  gem 'ruby_parser'

  # for typical deployment
  # gem 'capistrano'

  # for heroku deployment
  gem 'heroku', :require => false
  gem 'git'
  gem 'taps'
end

group :test do
  gem 'capybara'
  gem 'cucumber-rails'
  gem 'database_cleaner'
  gem 'factory_girl_rails'
  gem 'launchy'
  gem 'spork'
end

group :test, :development do
  gem 'factory_girl_generator'
  gem 'rspec-rails'
end

group :test, :development, :staging do
  gem 'ruby-debug19'
end
