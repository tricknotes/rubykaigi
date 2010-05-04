begin
  require 'delayed/tasks'
rescue LoadError
  STDERR.puts "Run `rake gems:install` to intall delayed_job"
end
