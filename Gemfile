source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.1'

gem 'rails', '~> 6.0.3.2'
gem 'mysql2', '~> 0.5.3'
gem 'puma', '~> 4.3'
gem 'webpacker', '~> 4.2', '>= 4.2.2'
gem 'jbuilder', '~> 2.10'
gem 'bootsnap', '~> 1.4', '>= 1.4.6', require: false
gem 'tzinfo-data', '~> 1.2019', '>= 1.2019.3'

## Delete these if using React/other for FE
## Let this be here for later usage
gem 'sass-rails', '>= 6'
gem 'turbolinks', '~> 5.2', '>= 5.2.1'

group :development, :test do
  gem 'byebug', '~> 11.1', '>= 11.1.1', platforms: [:mri, :mingw, :x64_mingw]

  # Custom gems:
  gem 'database_cleaner', '~> 1.8', '>= 1.8.4'
  gem 'simplecov', '~> 0.17.1'
  gem 'shoulda-matchers', '~> 4.3'
  gem 'rails-controller-testing', '~> 1.0', '>= 1.0.4'
  gem 'rspec-rails', '~> 4.0'
  gem 'factory_bot_rails', '~> 5.1', '>= 5.1.1'
  gem 'faker', '~> 2.11'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '~> 4.0', '>= 4.0.1'
  gem 'listen', '~> 3.2', '>= 3.2.1'
  gem 'spring', '~> 2.1'
  gem 'spring-watcher-listen', '~> 2.0', '>= 2.0.1'

  # Custom gems:
  gem 'brakeman', '~> 4.8'
  gem 'bundler-audit', '~> 0.6.1'
  gem 'letter_opener', '~> 1.7'
end

# Custom test gems
group :test do
  gem 'capybara', '~> 3.32', '>= 3.32.1'
  gem 'selenium-webdriver', '~> 3.142', '>= 3.142.7'
  gem 'webdrivers', '~> 4.2'
  gem 'webmock', '~> 3.8', '>= 3.8.3'
  gem 'capybara-screenshot', '~> 1.0', '>= 1.0.24'
end

## Custom Gems:
gem 'figaro', '~> 1.1', '>= 1.1.1'
gem 'redcarpet', '~> 3.5'
gem 'devise', '~> 4.7', '>= 4.7.1'
gem 'omniauth-github', '~> 1.4'
gem 'omniauth-google-oauth2', '~> 0.8.0'
gem 'omniauth-twitter', '~> 1.4'
gem 'activerecord-session_store', '~> 1.1', '>= 1.1.3'
gem 'active_model_otp', :git => 'https://github.com/heapsource/active_model_otp.git'
gem 'rack-cors', '~> 1.1', '>= 1.1.1'
gem 'sitemap_generator', '~> 6.1'
gem 'exception_notification', git: "https://github.com/cdadityang/exception_notification"
gem 'slack-notifier', '~> 2.3', '>= 2.3.2'
gem 'httparty', '~> 0.18.1'
gem 'exception-track', '~> 1.1'