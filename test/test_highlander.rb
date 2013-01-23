#######################################################################
# test_highlander.rb
#
# Test suite for the highlander gem.
#######################################################################
require 'test/unit'
require 'highlander'

class TC_Highlander < Test::Unit::TestCase
  def setup
  end

  def test_version
    assert_equal("0.1.1", Highlander::VERSION)
  end

  def teardown
  end
end
