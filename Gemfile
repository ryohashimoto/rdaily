source 'https://rubygems.org'
ruby '2.0.0'

gem 'rails', '4.0.0'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'redcarpet' # for Markdown syntax
gem 'kaminari'  # for paginations
gem 'gravtastic' # for gravatar
gem 'carrierwave'
gem 'fog'
gem 'mini_magick'
gem 'pygments.rb' # for syntax highlighting
gem 'memcachier'
gem 'dalli'

# Gems used only for assets and not required
# in production environments by default.
gem 'sass-rails',   '~> 4.0.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'zurb-foundation'

gem 'jquery-rails'

# To use ActiveModel has_secure_password
gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
gem 'rails_12factor', group: :production

group :development, :test do
  gem 'pry-rails'
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'sqlite3'
  gem 'heroku'
end

group :test do
  gem 'faker'
  gem 'capybara'
  gem 'database_cleaner'
  gem 'launchy'
end

group :production do
  gem 'pg'
  gem 'thin'
end
