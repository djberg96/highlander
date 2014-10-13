#######################################################################
# test_highlander.rb
#
# Test suite for the highlander gem. Easier to test on the command
# line than with a formal test suite, hence the sparseness here.
#######################################################################
require 'test/unit'
require 'highlander'

class TC_Highlander < Test::Unit::TestCase
  def setup
  end

  def test_version
    assert_equal("0.1.2", Highlander::VERSION)
  end

  def teardown
  end
end
