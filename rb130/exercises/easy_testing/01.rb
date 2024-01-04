# Write a minitest assertion that will fail if the value.odd? is not true.

require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'test_program'


class ExerciseTest < Minitest::Test
  def test_odd?
    value = Value.new(3)
    # assert value.odd?, 'value is not odd'
    assert_equal(true, value.odd?, 'value is not odd')
  end
end