require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

require "rake/extensiontask"

task :build => :compile

Rake::ExtensionTask.new("github_rb") do |ext|
  ext.lib_dir = "lib/github_rb"
end

task :default => [:clobber, :compile, :spec]
