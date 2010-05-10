RAILS_ROOT="/home/rubykaigi/railsapp/current"

God.watch do |w|
  w.name = "delayed_job"
  w.pid_file = "#{RAILS_ROOT}/tmp/pids/delayed_job.pid"
  w.start = "cd #{RAILS_ROOT}; RAILS_ENV=production script/delayed_job start"
  w.restart = "cd #{RAILS_ROOT}; RAILS_ENV=production script/delayed_job restart"
  w.stop = "cd #{RAILS_ROOT}; RAILS_ENV=production script/delayed_job stop"
  w.behavior(:clean_pid_file)
  w.start_if do |start|
    start.condition(:process_running) do |c|
      c.running = false
      c.interval = 5.seconds
    end
  end
end