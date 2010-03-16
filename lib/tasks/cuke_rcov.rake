begin
  require "cucumber/rake/tasks"

  namespace :features do
  	Cucumber::Rake::Task.new(:rcov, "Run features w/ rcov") do |t|
  		t.cucumber_opts = "--format progress"
  		t.rcov = true
  		t.rcov_opts = IO.readlines(File.join('spec', 'rcov.opts')).map {|line| line.chomp.split(" ") }.flatten
  		rcov_dir = File.expand_path("coverage.features", Rails.root)
  		t.rcov_opts << " -o #{rcov_dir}"
  	end

    namespace :coverage do
      task :clean do
        rm File.expand_path("coverage.features", Rails.root), :force => true
        rm File.expand_path("coverage.aggregate", Rails.root), :force => true
        mkdir File.expand_path("coverage.features", Rails.root) unless File.expand_path("coverage.features", Rails.root)
      end
    end

    task :rcov => "features:coverage:clean"
  end
rescue LoadError
  desc "feature:rcov rake task not available (cucumber not installed)"
  task :rcov do
    abort "Feature:rcov task is not available. Be sure to install cucumber as a gem or plugin"
  end
end
