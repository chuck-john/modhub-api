# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.0'

gem 'rails', '~> 6'

gem 'bcrypt'
gem 'jsonapi-serializer'
gem 'jwt'
gem 'pg'
gem 'puma'
gem 'rack-cors'
gem 'sass-rails'

group :development do
  gem 'annotate', require: false
  gem 'listen'
  gem 'spring'
end

group :development, :test do
  gem 'rspec-rails'
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', require: false
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
