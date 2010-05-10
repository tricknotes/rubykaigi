set :branch, "master"
server 'linode.rubykaigi.org', :app, :web, :db, :primary => true

set :rake, "/usr/local/bin/rake"

after 'deploy:finalize_update', 'bundler:bundle'
