source 'https://rubygems.org'

Encoding.default_external = Encoding::UTF_8
Encoding.default_internal = Encoding::UTF_8

# updated min versions per github security warnings
ruby '2.6.3' # was 2.4.5 was 2.4.3 - scm 

gem 'rails', '~>5.1.4' # was 5.0.6 - scm

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'pg', '~> 0.18'  # postgre db gem , but not v 1.0.0, which is not compatible -scm
gem 'sidekiq'

gem 'sass-rails'
gem 'coffee-rails'

#gem 'less-rails'
#gem 'therubyracer', platform: :ruby, require: 'v8'
gem 'mini_racer'

#gem 'less-js'

gem 'uglifier'

gem "bootstrap", ">= 4.3.1"

source 'https://rails-assets.org' do
  gem 'rails-assets-tether', '>= 1.1.0'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# To use debugger
# gem 'debugger'

group :development, :test do
#  gem 'simplecov', platform: :ruby, require: false, group: :test
  gem 'rspec-rails'
  gem 'rspec-collection_matchers'
  gem 'thin'
  gem 'factory_bot_rails'
  gem 'capybara'
  gem 'poltergeist'
  gem 'database_cleaner'
  gem 'launchy'
  gem 'coveralls', require: false
  gem 'test-unit'
  gem 'capistrano-sidekiq'
end

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'annotate'
  gem 'railroady'

  gem 'guard'
  gem 'guard-rspec'
  gem 'rb-inotify', :require => false
  gem 'rb-fsevent', :require => false
  gem 'rb-fchange', :require => false
  gem 'rb-readline'
end

gem 'puma', '>= 3.12.2'

group :development do
  gem 'capistrano'
  gem 'capistrano-rails'
  gem 'capistrano-rbenv'
  gem 'capistrano3-puma'
  gem 'capistrano3-nginx'
  gem 'capistrano-upload-config'
end

gem 'rack-mini-profiler'
gem 'haml-rails'
gem 'simple_form', '>= 5.0.0'
gem 'will_paginate'
gem 'devise', ">= 4.7.1"
gem 'dalli'
gem 'redis'
gem 'multa_arcana', '>= 1.1.4'
gem 'rubyzip', ">= 1.3.0"
gem 'zip-zip' #compatability for old rubyzip api
gem 'prawn'
gem 'prawn-table'
gem 'ri_cal'
gem 'axlsx'
gem 'redcarpet'
gem 'htmlentities'
gem 'paper_trail'
gem 'active_model_serializers'
gem 'hashie'
gem 'diff-lcs'
gem 'liquid'

# not previously in Gemfile - scm 2020-01-16
gem "actionview", ">= 5.1.6.2"
gem "ffi", ">= 1.9.24"
#gem "sprockets", ">= 3.7.2"
gem "sprockets", "~> 4.0.0"
gem "nokogiri", ">= 1.10.4"
gem "activejob", ">= 5.1.6.1"
gem "rack", ">= 2.0.8"
gem "rails-html-sanitizer", ">= 1.0.4"
gem "loofah", ">= 2.3.1"

#
# For HTML-format email that isn't so painful to format
# This gem crashes Ruby on my mac...  both macs...  so, remove it from
# test since we don't verify that the gem works, just that the email
# renders.
#
gem 'roadie', :group => [ :development, :production ]
