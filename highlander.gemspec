require 'rubygems'

Gem::Specification.new do |spec|
  spec.name       = 'highlander'
  spec.version    = '0.3.0'
  spec.license    = 'Apache-2.0'
  spec.author     = 'Daniel J. Berger'
  spec.email      = 'djberg96@gmail.com'
  spec.homepage   = 'https://github.com/djberg96/highlander'
  spec.summary    = 'There can be only one! Process, that is.'
  spec.test_files = Dir['spec/*.rb']
  spec.files      = Dir['**/*'].reject{ |f| f.include?('git') }
  spec.cert_chain = ['certs/djberg96_pub.pem']

  spec.add_development_dependency('rspec', '~> 3.11')

  spec.metadata = {
    'homepage_uri'          => 'https://github.com/djberg96/highlander',
    'bug_tracker_uri'       => 'https://github.com/djberg96/highlander/issues',
    'changelog_uri'         => 'https://github.com/djberg96/highlander/blob/MacLeod/CHANGES.md',
    'documentation_uri'     => 'https://github.com/djberg96/highlander/wiki',
    'source_code_uri'       => 'https://github.com/djberg96/highlander',
    'wiki_uri'              => 'https://github.com/djberg96/highlander/wiki',
    'rubygems_mfa_required' => 'true'
  }

  spec.description = <<-EOF
    The highlander spec ensures that only one instance of the current
    process is running. If you try to run the same Ruby program again
    it will raise a RuntimeError instead.
  EOF
end
