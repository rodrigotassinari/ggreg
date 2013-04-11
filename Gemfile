source 'https://rubygems.org'
ruby '2.0.0'

gem 'rails', '3.2.13'
gem 'rake', '10.0.4'
gem 'pg', '0.15.1'
gem 'jquery-rails', '2.2.1'
gem 'unicorn', '4.6.2'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer', :platforms => :ruby
  gem 'uglifier', '~> 2.0.1'
  gem 'yui-compressor', '~> 0.9.6'
  gem 'zurb-foundation', '~> 4.1.2'
  # gem 'compass-rails', '~> 1.0.3'
end

group :development do
  gem 'foreman', '~> 0.62'
  gem 'git_remote_branch', '~> 0.3'
  gem 'clean_logger', '~> 0.0'
end

group :test do
  gem 'simplecov', '~> 0.7', :require => false
end

group :development, :test do
  gem 'rspec-rails', '~> 2.13'
  gem 'factory_girl_rails', '~> 4.2'
  gem 'vcr', '~> 2.4'
  gem 'fakeweb', '~> 1.3'
  gem 'timecop', '~> 0.6'
  gem 'pry', '~> 0.9'
  gem 'pry-nav', '~> 0.2'
  gem 'pry-doc', '~> 0.4'
  gem 'awesome_print', '~> 1.1'
end
