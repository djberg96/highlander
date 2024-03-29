#######################################################################
# highlander_spec.rb
#
# Test suite for the highlander library.
#######################################################################
require 'rspec'
require 'highlander'

RSpec.describe Highlander do
  let(:filename){ 'highlander_test.rb' }
  let(:outfile){ 'highlander_output.txt' }

  before do
    File.open(filename, 'w') do |fh|
      fh.puts 'require_relative "lib/highlander"'
      fh.puts '3.times{ puts "hello"; sleep 1 }'
    end
  end

  after do
    File.delete(filename) if File.exist?(filename)
    File.delete(outfile) if File.exist?(outfile)
  end

  example "version" do
    expect(Highlander::VERSION).to eq('0.3.0')
    expect(Highlander::VERSION).to be_frozen
  end

  example "attempting to run multiple instances will fail" do
    pid1 = Process.spawn("ruby #{filename}", [:out, :err] => IO::NULL)
    sleep 1 # Make sure pid1 runs first, is there a better way?
    pid2 = Process.spawn("ruby #{filename}", :err => [outfile, 'w'], :out => IO::NULL)

    status1 = Process.waitpid2(pid1).last
    status2 = Process.waitpid2(pid2).last

    expect(status1.exitstatus).to eq(0)
    expect(status2.exitstatus).not_to eq(0)
    expect(File.read(outfile)).to include("There can be only one!")
  end
end
