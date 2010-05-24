module WithRedis
  def redis
    if config = Rails.configuration.database_configuration[Rails.env]['redis']
      Thread.current[:redis] ||= Redis.new(config.with_indifferent_access.merge(:logger => Rails.logger))
    else
      $stderr.puts <<-WARN
*** WARNING ***
Redis setting is not found. Twitter API is called every time.
Please add the setting referring to config/database.yml.sample.
      WARN

      nil
    end
  end
end
