# Settings specified here will take precedence over those in config/environment.rb

# The test environment is used exclusively to run your application's
# test suite.  You never need to work with it otherwise.  Remember that
# your test database is "scratch space" for the test suite and is wiped
# and recreated between test runs.  Don't rely on the data there!
config.cache_classes = false

# Log error messages when you accidentally call methods on nil.
config.whiny_nils = true

# Show full error reports and disable caching
config.action_controller.consider_all_requests_local = true
config.action_controller.perform_caching             = false

# Disable request forgery protection in test environment
config.action_controller.allow_forgery_protection    = false

# Tell Action Mailer not to deliver emails to the real world.
# The :test delivery method accumulates sent emails in the
# ActionMailer::Base.deliveries array.
config.action_mailer.delivery_method = :test

config.gem "cucumber", :lib => false, :version => ">= 0.6.3" unless File.directory?(File.join(Rails.root, 'vendor/plugins/cucumber'))
config.gem "cucumber-rails", :lib => false, :version => ">= 0.3.0" unless File.directory?(File.join(Rails.root, 'vendor/plugins/cucumber-rails'))
config.gem "webrat", :lib => false, :version => ">= 0.7.0" unless File.directory?(File.join(Rails.root, 'vendor/plugins/webrat'))
config.gem "database_cleaner", :lib => false, :version => ">= 0.5.0" unless File.directory?(File.join(Rails.root, 'vendor/plugins/database_cleaner'))
config.gem "rspec", :lib => false, :version => ">= 1.3.0" unless File.directory?(File.join(Rails.root, 'vendor/plugins/rspec'))
config.gem "rspec-rails", :lib => false, :version => ">= 1.3.2" unless File.directory?(File.join(Rails.root, 'vendor/plugins/rspec-rails'))
config.gem "nokogiri", :lib => false
config.gem "thoughtbot-factory_girl", :lib => 'factory_girl', :source => 'http://gems.github.com'
config.gem "rr", :lib => false
config.gem 'bmabey-email_spec', :lib => 'email_spec'
config.gem 'timcharper-spork', :lib => false
