# Write a minitest assertion that will fail if the class of value is not Numeric or one of Numeric's subclasses (e.g., Integer, Float, etc).

require 'minitest/autorun'

require_relative 'test_program'

class ExerciseTest < Minitest::Test
  def test_class_or_subclass_of_numeric
    value = 1
    # assert value.class.ancestors.include?(Numeric)
    # assert_includes value.class.ancestors, Numeric
    assert_kind_of Numeric, value
  end
end