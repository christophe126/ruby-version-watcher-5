source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"

gem "bootsnap", require: false
gem "importmap-rails"
gem "jbuilder"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "rails", "~> 7.0.2", ">= 7.0.2.4"
gem "sprockets-rails"
gem "stimulus-rails"
gem "turbo-rails"
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem 'bootstrap', '~> 5.1.3'
gem 'mechanize', '~> 2.7', '>= 2.7.5'
gem 'bundler', '~> 2.3', '>= 2.3.14'
gem 'whenever', require: false

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]

end

group :development do
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end
