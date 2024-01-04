# Write a minitest assertion that will fail if the 'xyz' is not in the Array list.

require 'minitest/autorun'

require_relative 'test_program'

class ExerciseTest < Minitest::Test
  def setup
    @something = Value.new(1)
  end

  def test_xyz_in_list
    # assert @something.list.include?('xyz')
    assert_includes @something.list, 'xyz'
  end
end