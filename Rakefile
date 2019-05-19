require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:unit) do |task|
  task.pattern = "spec/unit/**/*_spec.rb"
  task.verbose = false
end

RSpec::Core::RakeTask.new(:acceptance) do |task|
  task.pattern = "spec/acceptance/**/*_spec.rb"
  task.verbose = false
end

desc "Runs all tests"
task spec: [:unit, :acceptance] do
end

task default: :spec

desc ""
RSpec::Core::RakeTask.new(:build) do |task|
  task.rspec_opts = [ "--format documentation" ]
  task.pattern = "spec/**/*_spec.rb"
  task.verbose = false
end
