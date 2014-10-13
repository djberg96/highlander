require 'rubygems'

Gem::Specification.new do |spec|
  spec.name       = 'highlander'
  spec.version    = '0.1.2'
  spec.license    = 'Artistic 2.0'
  spec.author     = 'Daniel J. Berger'
  spec.email      = 'djberg96@gmail.com'
  spec.homepage   = 'https://github.com/djberg96/highlander'
  spec.summary    = 'There can be only one! Process, that is.'
  spec.test_files = Dir['test/test*']
  spec.files      = Dir['**/*'].reject{ |f| f.include?('git') }

  spec.extra_rdoc_files  = ['README', 'CHANGES', 'MANIFEST']

  spec.description = <<-EOF
    The highlander spec ensures that only once instance of the current
    process is running. If you try to run the same Ruby program again
    it will raise a RuntimeError instead.
  EOF
end
