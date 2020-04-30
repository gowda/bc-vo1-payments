# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '~> 2.6.0'

rails_version = '~> 6.0.2'
gem 'actionpack', rails_version
gem 'actionview', rails_version
gem 'activemodel', rails_version
gem 'activerecord', rails_version
gem 'railties', rails_version

gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 4.1'

kaminari_version = '~> 1.2.0'
gem 'kaminari-activerecord', kaminari_version
gem 'kaminari-core', kaminari_version

gem 'faker', '~> 2.11.0'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'dotenv-rails'
  gem 'rspec-rails', '~> 4.0.0'
  gem 'rubocop', require: false
  gem 'sqlite3', '~> 1.4'
end

group :test do
  gem 'rails-controller-testing'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
end
