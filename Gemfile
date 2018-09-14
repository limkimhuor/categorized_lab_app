source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby "2.5.0"

gem "bootsnap", ">= 1.1.0", require: false
gem "coffee-rails", "~> 4.2"
gem "config"
gem "dotenv-rails"
gem "font-awesome-sass", "~> 4.7.0"
gem "jquery-rails"
gem "kaminari"
gem "mysql2"
gem "puma", "~> 3.11"
gem "rails", "~> 5.2.1"
gem "sass-rails", "~> 5.0"
gem "slim-rails"
gem "turbolinks", "~> 5"
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem "uglifier", ">= 1.3.0"

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "factory_bot_rails"
  gem "faker"
  gem "pry-rails"
  gem "rspec"
  gem "rspec-collection_matchers"
  gem "rspec-rails"
end

group :development do
  gem "web-console", ">= 3.3.0"
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end
