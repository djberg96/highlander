#######################################################################
# highlander_spec.rb
#
# Test suite for the highlander library.
#######################################################################
require 'rspec'
require 'highlander'

RSpec.describe Highlander do
  let(:filename){ 'highlander_test.rb' }

  before do
    File.open(filename, 'w') do |fh|
      fh.puts 'require_relative "lib/highlander"'
      fh.puts '3.times{ puts "hello"; sleep 1 }'
    end
  end

  after do
    File.delete(filename) if File.exist?(filename)
  end

  example "version" do
    expect(Highlander::VERSION).to eq('0.2.4')
    expect(Highlander::VERSION).to be_frozen
  end

  example "attempting to run multiple instances will fail" do
    pid1 = Process.spawn("ruby #{filename}", :out => IO::NULL)
    pid2 = Process.spawn("ruby #{filename}", :out => IO::NULL)
    status1 = Process.waitpid2(pid1).last
    status2 = Process.waitpid2(pid2).last

    expect(status1.exitstatus).to eq(0)
    expect(status2.exitstatus).not_to eq(0)
  end
end
