require 'rake'
require 'rake/clean'
require 'rake/testtask'

CLEAN.include("**/*.gem", "**/*.rbc")

namespace 'gem' do
  desc 'Create the highlander gem'
  task :create => [:clean] do
    spec = eval(IO.read('highlander.gemspec'))
    Gem::Builder.new(spec).build
  end

  desc 'Install the highlander gem'
  task :install => [:create] do
    file = Dir["*.gem"].first
    sh "gem install #{file}"
  end
end

Rake::TestTask.new do |t|
  t.verbose = true
  t.warning = true
end

task :default => :test
