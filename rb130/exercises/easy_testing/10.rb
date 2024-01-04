# Write a test that will fail if 'xyz' is one of the elements in the Array list:

require 'minitest/autorun'

class ExerciseTest < Minitest::Test
  def test_does_not_include_xyz
    list = [1, 2, 3, "xyz"]
    refute_includes list, 'xyz'
  end
end