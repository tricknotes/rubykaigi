set :branch, "production"
server 'linode.rubykaigi.org', :app, :web, :db, :primary => true

#set :rake, "/home/#{application}/gem.repos/bin/rake"
