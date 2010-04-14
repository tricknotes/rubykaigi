Sham.name { Faker::Internet.user_name }
Sham.twitter_user_id {|i| i }

Rubyist.blueprint do
  name
  twitter_user_id
end
