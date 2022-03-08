source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.0"
gem "rails", "~> 7.0.0"
gem 'jquery-rails'
gem "rails-controller-testing"
gem "bootstrap", "~> 5.1.0"
gem "sassc-rails", "~> 2.1"
gem "sprockets-rails"
gem "passenger", require: "phusion_passenger/rack_handler"
gem "sqlite3", "~> 1.4"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
gem "twitter"
gem "bcrypt"
gem "image_processing", ">= 1.2"
gem "mini_magick", "4.9.5"
gem "active_storage_validations", "0.8.9"
gem "redis"
gem "sidekiq"
gem "sidekiq-scheduler"
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem "bootsnap", require: false

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
end

group :development do
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end
