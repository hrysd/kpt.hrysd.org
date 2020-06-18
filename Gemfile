source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby '2.6.6'

gem 'rails', '5.2.4.3'

gem 'active_model_serializers'
gem 'font-awesome-rails'
gem 'hamlit'
gem 'pg'
gem 'puma'
gem 'redis'
gem 'sass-rails'

group :development do
  gem 'byebug', group: :test
end

group :production do
  gem 'sentry-raven'
end
