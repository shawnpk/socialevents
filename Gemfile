source 'https://rubygems.org'

ruby '2.4.3'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# Rails default gems
gem 'rails', '~> 5.1.4'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'

# User added gems
gem 'awesome_print', '~> 1.8'
gem 'validates_timeliness', '~> 4.0', '>= 4.0.2'
gem 'bootstrap-sass', '~> 3.3', '>= 3.3.7'
gem 'jquery-rails', '~> 4.3', '>= 4.3.1'
gem 'font-awesome-rails', '~> 4.7', '>= 4.7.0.2'
gem 'simple_form', '~> 3.5'
gem 'devise', '~> 4.4'
gem 'pundit', '~> 1.1'
gem 'friendly_id', '~> 5.2', '>= 5.2.3'
gem 'carrierwave', '~> 1.2', '>= 1.2.2'
gem 'fog', '~> 1.42'
gem 'mini_magick', '~> 4.8'
gem 'searchkick', '~> 2.4'
gem 'will_paginate', '~> 3.1', '>= 3.1.6'
gem 'bootstrap-will_paginate', '~> 1.0'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]

  # User added gems
  gem 'rspec-rails', '~> 3.7', '>= 3.7.2'
  gem 'factory_bot_rails', '~> 4.8', '>= 4.8.2'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  # User added gems
  gem 'guard-livereload', '~> 2.5', '>= 2.5.2'
  gem 'better_errors', '~> 2.4'
  gem 'capybara', '~> 2.17'
end

# User added gems
group :test do
  gem 'database_cleaner', '~> 1.6', '>= 1.6.2'
end

group :production do
  gem 'rails_12factor'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
