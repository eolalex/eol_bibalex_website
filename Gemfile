source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end
gem 'ruby-ntlm'
gem 'fog'
gem 'neography'
# gem 'sprockets-rails', require: 'sprockets/railtie'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.6'
# This is used to locally have a copy of OpenSans. IF YOU STOP USING OPENSANS, YOU SHOULD REMOVE THIS GEM!
gem 'font-kit-rails'
# Use mysql2 as the database for Active Record
gem 'mysql2'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
gem 'acts_as_list'
gem 'therubyracer', platforms: :ruby

gem 'rack-cors', require: 'rack/cors'
gem "lazyload-rails"
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'
gem 'jquery-rails'
gem 'jquery-turbolinks'
gem 'haml-rails'
gem 'searchkick'
gem 'elasticsearch-model'
gem 'will_paginate'
gem 'twitter-typeahead-rails'
#gem 'rails4-autocomplete'
gem "js-routes"
gem 'record_tag_helper'
# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

gem 'simple_form'
gem 'rest-client'
gem "hash_to_hidden_fields"

gem 'devise', '~> 4.1'
gem 'bootstrap-sass', '~> 3.3.7' 
gem 'tlsmail' 
gem 'dotenv-rails', :require => 'dotenv/rails-now'
gem "recaptcha", require: "recaptcha/rails"
gem 'omniauth'
# gem 'omniauth-facebook'
gem 'omniauth-facebook', '~> 4.0.0' 
gem 'omniauth-twitter'
gem 'omniauth-google-oauth2' 
#gem 'omniauth-google' 
gem 'twitter'
gem 'counter_culture', '~> 1.8'
# gem 'fb_graph'
gem  'refinerycms' , '~> 4.0.2' 
# gem  'refinerycms-authentication-devise' 
gem  'refinerycms-wymeditor'
gem  'refinerycms-i18n' 

gem "active_record_bulk_insert"
gem 'bulk_insert'
gem "geo_coord"
gem 'render_async'
gem 'whenever', require: false
# gem 'ar-extensions'
 

# gem  'geocoder'
# gem 'gmaps4rails'
# gem 'leaflet-rails'


group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
  gem 'rails-erd'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
