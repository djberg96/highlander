require 'rubygems'

Gem::Specification.new do |gem|
  gem.name       = 'highlander'
  gem.version    = '0.1.0'
  gem.license    = 'Artistic 2.0'
  gem.author     = 'Daniel J. Berger'
  gem.email      = 'djberg96@gmail.com'
  gem.homepage   = 'http://www.rubyforge.org/projects/shards'
  gem.summary    = 'There can be only one! Process, that is.'
  gem.test_files = Dir['test/test*']
  gem.has_rdoc   = true
  gem.files      = Dir['**/*'].reject{ |f| f.include?('git') }

  gem.rubyforge_project = 'shards'
  gem.extra_rdoc_files  = ['README', 'CHANGES', 'MANIFEST']

  gem.description = <<-EOF
    The highlander gem ensures that only once instance of the current
    process is running. If you try to run the same Ruby program again
    it will raise a RuntimeError instead.
  EOF

  gem.add_development_dependency('test-unit', '>= 2.1.1')
end
