RAILS_ROOT="/home/rubykaigi/railsapp/current"

God.watch do |w|
  w.name = "delayed_job"
  w.start = "cd #{RAILS_ROOT} && RAILS_ENV=production script/delayed_job run"
  w.start_if do |start|
    start.condition(:process_running) do |c|
      c.running = false
      c.interval = 30.seconds
    end
  end
end