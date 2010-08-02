namespace :db do
  desc 'Load the seed data from db/seeds_2010.rb'
  task :seed_2010 => :environment do
    seed_file = File.join(Rails.root, 'db', 'seeds_2010.rb')
    load(seed_file) if File.exist?(seed_file)
    if ActionController::Base.perform_caching = true
      cache_dir = File.join(Rails.root, 'tmp', 'rails-cache')
      if File.exist?(cache_dir) && File.directory?(cache_dir)
        FileUtils.rm_rf cache_dir, :verbose => true
      end
    end
  end
end
