source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '5.0.1'

gem 'jquery-rails'
gem 'pg'
gem 'puma'
gem 'sass-rails'
gem 'turbolinks'
gem 'uglifier'

group :development do
  gem 'byebug', group: :test
end
