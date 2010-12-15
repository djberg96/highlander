#######################################################################
# test_highlander.rb
#
# Test suite for the highlander gem.
#######################################################################

# usage: ruby -I lib/ -I test/ test/test_highlander.rb
require 'test/unit'
require 'highlander'
require 'testing_helper.rb'

class TC_Highlander < Test::Unit::TestCase
  include TestingHelper
  
  def setup
  end

  def test_version
    assert_equal("0.1.0", Highlander::VERSION)
  end

  def test_at_exit
    delete_flag_file
    call_locking_runner
    assert_equal(true, File.exists?(FLAG_FILE))
    delete_flag_file
  end
  
  def test_locking
    locked = fork do
      exec("ruby -I #{LIB} #{RUNNER} --sleep 1000")
    end
    # at this point `ps -aux | grep locking_runner` will be running
    # also lsof <filename> will have W in the fd ie.file-descriptor column
    Process.detach(locked)

    # WTF!!!
    # TODO: need this due to some reason otherwise the exitstatus is zero
    # and the 'locked' process forked above is not killed.
    sleep 5

    # TODO: suppress the error output
    call_locking_runner
    assert_equal(1, $?.exitstatus)

    #cleanup
    Process.kill("HUP", locked)
  end
end
