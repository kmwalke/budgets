source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.4.3'

gem 'aws-sdk-s3'
gem 'bcrypt'
gem 'bootsnap'
gem 'csv'
gem 'devise'
gem 'faraday'
gem 'importmap-rails'
gem 'jbuilder'
gem 'pg'
gem 'puma'
gem 'rails'
gem 'redis'
gem 'sass-rails'
gem 'sidekiq'
gem 'turbo-rails'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'factory_bot_rails'
  gem 'guard'
  gem 'guard-livereload'
  gem 'guard-rspec'
  gem 'pry-rails'
  gem 'rspec-rails'
  gem 'sprockets'
end

group :development do
  gem 'listen'
  gem 'rubocop'
  gem 'rubocop-capybara'
  gem 'rubocop-daemon', require: false
  gem 'rubocop-factory_bot'
  gem 'rubocop-performance'
  gem 'rubocop-rails'
  gem 'rubocop-rspec'
  gem 'rubocop-rspec_rails'
  gem 'spring'
  gem 'spring-watcher-listen'
  gem 'web-console'
end

group :test do
  gem 'capybara'
  gem 'rails-controller-testing'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end
