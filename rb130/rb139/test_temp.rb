require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'temp'

class TempTest < Minitest::Test
  def test_1
    assert_equal 1, 1
  end
end