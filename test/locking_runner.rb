require 'optparse'
require 'highlander.rb'

def highlander_at_exit
  super
  `touch /tmp/highlander_at_exit.txt`
end

sec = nil
OptionParser.new do |opts|
  opts.banner = "Usage: #{__FILE__} [options]"

  opts.on("-s", "--sleep sec", Integer, "seconds to sleep ") do |f|
    sec = f
  end
end.parse!

sleep sec if sec
