# Write a minitest assertion that will fail if value is not an instance of the Numeric class exactly. value may not be an instance of one of Numeric's superclasses.

require 'minitest/autorun'

require_relative 'test_program'

class ExerciseTest < Minitest::Test
  def test_num_class?
    value = Value.new('asdf')
    assert_instance_of Numeric, value
  end
end