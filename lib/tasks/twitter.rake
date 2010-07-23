namespace :twitter do
  desc 'Update twitter account information'
  task :wash_whale => :environment do
    Rubyist.find_in_batches(:conditions => 'twitter_user_id IS NOT NULL', :select => 'twitter_user_id', :batch_size => 100) do |rubyists|
      $twitter.users(*rubyists.map(&:twitter_user_id)).each do |profile|
        TwitterProfile[profile.id] = profile.slice(:screen_name, :profile_image_url)
      end
    end
  end
end
