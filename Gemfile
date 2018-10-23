source 'https://rubygems.org'
ruby File.read(File.join(File.dirname(__FILE__), '.ruby-version')).strip

gem 'rails'
gem 'pg'
gem 'puma'
gem 'sass-rails'
gem 'uglifier'

gem 'simple_form'
gem 'state_machines-activerecord'

gem 'administrate'
gem 'administrate-field-active_storage'
gem 'rails-i18n'

gem 'sidekiq'

gem 'devise'
gem 'devise-async'
gem 'devise_invitable'
gem 'devise-i18n'
gem 'devise-bootstrap-views'

gem 'select2-rails'
gem 'haml-rails'
gem 'actionview-encoded_mail_to'

gem 'font-awesome-sass'
gem "aws-sdk-s3", require: false

group :development, :test do
  gem 'dotenv-rails'
  gem 'rspec-rails'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'rspec-rails'
end

group :test do
  gem 'rspec_junit_formatter'
  gem 'factory_bot_rails'
  gem 'shoulda-matchers'
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'
  gem 'email_spec'
end
