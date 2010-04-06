Rails.configuration.middleware.use RailsWarden::Manager do |manager|
	manager.oauth :twitter do |twitter|
		twitter.options :site => 'http://twitter.com'
		twitter.consumer_key  = configatron.twitter.consumer_key
		twitter.consumer_secret = configatron.twitter.consumer_secret
	end

	manager.default_strategies :twitter_oauth
	manager.failure_app = WelcomeController
end

Warden::OAuth.access_token_user_finder(:twitter) do |access_token|
	# TODO 鯨対策
	twitter_user_id = OAuthRubytter.new(access_token).verify_credentials.id
	Rubyist.find_or_initialize_by_twitter_user_id(twitter_user_id)
end

class Warden::SessionSerializer
	def serialize(record)
		[record.class, record.id]
	end

	def deserialize(keys)
		klass, id = keys
		klass.find_by_id(id)
	end
end
