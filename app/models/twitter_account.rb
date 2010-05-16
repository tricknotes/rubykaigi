class TwitterAccount
  include WithRedis
  include WithTwitter
  extend ActiveSupport::Memoizable

  def initialize(twitter_user_id)
    @user_id = twitter_user_id
  end

  attr_reader :user_id

  ATTRS = %w(name screen_name url profile_image_url)

  ATTRS.each do |attr|
    define_method attr do
      attributes[attr]
    end
  end

  def attributes
    JSON.parse(redis[key] ||= fetch_single)
  rescue Twitter::NotFound
    {}
  end
  memoize :attributes

  def fetch_single
    twitter.user(user_id).slice(*ATTRS).to_json
  end

  def key
    "twitter/#{user_id}"
  end
end
