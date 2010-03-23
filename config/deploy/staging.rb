set :branch, "master"
set :deploy_server, "rubykaigi.kakutani.com"

set :rake, "/usr/local/bin/rake"

after 'deploy:finalize_update', 'bundler:bundle'
