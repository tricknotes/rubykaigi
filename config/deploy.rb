# -*- coding: utf-8 -*-
require "capistrano/ext/multistage"
set :default_stage, "staging"
trigger :start

set :application, "rubykaigi"
set :repository,  "git://github.com/ruby-no-kai/rubykaigi.git"
set :branch, "production"

set :deploy_to, "/home/#{application}/railsapp"
set :ssh_options, { :forward_agent => true }

set :scm, :git
set :git_shallow_clone, 1

set :use_sudo, false
set :runner, "rubykaigi"
ssh_options[:username] = application

role(:app) { [deploy_server] }
role(:web) { [deploy_server] }
role(:db) { [deploy_server, {:primary => true}] }

def setup_shared(dir, path)
  src = "#{shared_path}/#{dir}/#{path}"
  dest = "#{latest_release}/#{dir}/#{path}"
  run "! test -e #{dest} && ln -s #{src} #{dest}"
end

def setup_shared_config(path)
  setup_shared("config", path)
end

namespace :deploy do
  task :start, :roles => :app do
  end

  desc "Restart Passenger"
  task :restart do
    run "touch #{latest_release}/tmp/restart.txt"
  end

  task :stop, :roles => :app do
  end

  namespace :web do
    desc "maintenance variable: REASON,UNTIL"
    task :disable, :roles => :web, :except => { :no_release => true } do
      require 'erb'
      on_rollback { run "rm #{shared_path}/system/maintenance.html" }

      reason = ENV['REASON']
      deadline = ENV['UNTIL']

      template = File.read(File.join(File.dirname(__FILE__), 'templates', 'maintenance.html.erb'))
      result = ERB.new(template).result(binding)

      put result, "#{shared_path}/system/maintenance.html", :mode => 0644
    end
  end
end

after("deploy:update_code") do
  setup_shared_config("database.yml")
  setup_shared_config("config.yml")
end

after("deploy:symlink") do
  run "mkdir -p #{current_path}/public/tmp"
  setup_shared("public/tmp", "pamphlet-20090708.zip")
  setup_shared("certs","app_cert.pem")
  setup_shared("certs","app_key.pem")
  setup_shared("certs","paypal_cert_sandbox.pem")
#  setup_shared("certs","paypal_cert_live.pem")
  run "cd #{current_path} && bundle exec whenever --update-crontab #{application}"
end

namespace :bundler do
  task :bundle do
    run("cd #{latest_release} && bundle install #{shared_path}/vendor/ --without development test cucumber && bundle lock")
  end
end

Dir[File.join(File.dirname(__FILE__), '..', 'vendor', 'gems', 'hoptoad_notifier-*')].each do |vendored_notifier|
  $: << File.join(vendored_notifier, 'lib')
end

require 'hoptoad_notifier/capistrano'
require 'capistrano-notification'

notification.irc do |irc|
  irc.host    'chat.freenode.net'
  irc.channel '#rubykaigi.org'
  irc.message "#{local_user} deployed #{application} to #{deploy_target}"
end
