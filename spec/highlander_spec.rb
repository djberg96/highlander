#######################################################################
# highlander_spec.rb
#
# Test suite for the highlander library.
#######################################################################
require 'rspec'
require 'highlander'
require 'open3'

RSpec.describe Highlander do
  let(:filename){ 'highlander_test.rb' }

  before do
    File.open(filename, 'w') do |fh|
      fh.puts 'require "highlander"'
      fh.puts '3.times{ sleep 1 }'
    end
  end

  after do
    File.delete(filename) if File.exists?(filename)
  end

  example "version" do
    expect(Highlander::VERSION).to eq('0.2.4')
    expect(Highlander::VERSION).to be_frozen
  end

  example "attempting to run multiple instances will fail" do
    system("ruby #{filename}")
    expect($?).to eq(0)

    system("ruby #{filename}")
    expect($?).not_to eq(0)
  end
end
