# -*- coding: utf-8 -*-
source :rubygems
source 'http://gems.github.com'

gem 'rails', '2.3.5', :require => nil
gem 'mysql'
gem 'configatron'
gem "ambethia-smtp-tls", :require => "smtp-tls"
gem "fastercsv"
gem "hoptoad_notifier"

gem 'haml'
gem 'fastercsv'

gem 'rails_warden'
gem 'warden_oauth'

# remove it later
gem 'ruby-openid', :require => 'openid'

group :development do
  gem 'capistrano', :require => nil
  gem 'capistrano-ext', :require => nil
  gem 'gettext', '<2' # required by i18n_generators
end

group :test, :cucumber do
  gem 'rspec-rails'
  gem 'rr'
  gem 'machinist'
  gem 'faker'
  gem 'email_spec'
  gem 'autotest-rails'
  gem 'daemons'
  gem 'spork'
  gem 'cucumber-rails'
  gem 'webrat'
  gem 'moro-miso'
  gem 'database_cleaner'
  gem 'nokogiri'
end
