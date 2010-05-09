unless ARGV.any? {|a| a =~ /^gems/} # Don't load anything when running the gems:* tasks

load File.dirname(__FILE__) + '/rspec.rake'

namespace :spec do
  desc "Run the code examples in spec/acceptance"
  Spec::Rake::SpecTask.new(:end2end => "db:test:prepare") do |t|
    t.spec_opts = ['--options', "\"#{RAILS_ROOT}/spec/spec.opts\""]
    t.spec_files = FileList["spec/end2end/**/*_spec.rb"]
  end
end

end
