module WithTwitter
  def twitter
    config = configatron.twitter

    oauth = Twitter::OAuth.new(config.consumer_key, config.consumer_secret)
    oauth.authorize_from_access config.access_token, config.access_secret

    Thread.current[:twitter] ||= Twitter::Base.new(oauth)
  end
end
