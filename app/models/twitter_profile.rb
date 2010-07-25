class TwitterProfile
  PREFIX = 'twitter/users'

  class << self
    def [](user_id)
      redis_object(user_id).value
    end

    def []=(user_id, value)
      redis_object(user_id).value = value
    end

    private

    def redis_object(user_id)
      Redis::Value.new("#{PREFIX}/#{user_id}", Redis::Objects.redis, :marshal => true)
    end
  end
end
