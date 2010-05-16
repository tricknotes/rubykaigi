class TwitterAccount
  include WithRedis
  include WithTwitter
  extend ActiveSupport::Memoizable

  def initialize(twitter_user_id)
    raise ArgumentError if twitter_user_id.blank?
    @user_id = twitter_user_id
  end

  attr_reader :user_id

  ATTRS = %w(screen_name profile_image_url)

  ATTRS.each do |attr|
    define_method attr do
      attributes[attr]
    end
  end

  def attributes
    JSON.parse(redis[key] ||= fetch_single)
  end
  memoize :attributes

  def fetch_single
    twitter.user(user_id).slice(*ATTRS).to_json
  end

  def key
    "twitter/#{user_id}"
  end
end
