source 'https://rubygems.org'
source 'https://rails-assets.org'

ruby '2.1.3'

gem 'rails', '4.1.6'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'redcarpet' # for Markdown syntax
gem 'kaminari'  # for paginations
gem 'gravtastic' # for gravatar
gem 'carrierwave'
gem 'unf'
gem 'fog', '>= 1.20.0'
gem 'mini_magick'
gem 'pygments.rb' # for syntax highlighting
gem 'memcachier'
gem 'dalli'

# Gems used only for assets and not required
# in production environments by default.
gem 'sass-rails', '~> 4.0.3'
gem 'coffee-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'foundation-rails', '~> 5.3.0.1'
gem 'foundation-icons-sass-rails'
gem 'compass-rails'
gem 'rails-assets-modernizr'
gem 'rails-assets-handlebars'
gem 'simple_form'

gem 'jquery-rails'

# To use ActiveModel has_secure_password
gem 'bcrypt'

# To use Jbuilder templates for JSON
gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
gem 'rails_12factor', group: :production

gem 'dotenv-rails'

gem 'thin'
gem 'unicorn'

gem 'capistrano', require: false
gem 'capistrano-rails', require: false
gem 'capistrano-rbenv', require: false
gem 'capistrano-bundler', require: false

group :development, :test do
  gem 'mysql2'
  gem 'pry-rails'
  gem 'rspec-rails'
  gem 'factory_girl_rails'
end

group :test do
  gem 'faker'
  gem 'capybara'
  gem 'database_cleaner'
  gem 'launchy'
  gem 'poltergeist'
end

group :production do
  gem 'pg'
end
