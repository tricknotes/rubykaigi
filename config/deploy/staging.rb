set :branch, "2010-prototype"
server 'staging.rubykaigi.org', :app, :web, :db, :primary => true

set :rake, "/usr/local/bin/rake"

after 'deploy:finalize_update', 'bundler:bundle'
