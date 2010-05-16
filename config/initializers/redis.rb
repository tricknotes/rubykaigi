module WithRedis
  def redis
    config = Rails.configuration.database_configuration[Rails.env]['redis'].with_indifferent_access
    Thread.current[:redis] ||= Redis.new(config.merge(:logger => Rails.logger))
  end
end
