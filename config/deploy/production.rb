set :branch, "production"
server 'rubykaigi.org', :app, :web, :db, :primary => true

set :rake, "/home/#{application}/gem.repos/bin/rake"
