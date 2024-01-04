require 'minitest/autorun'

require_relative 'test_program'

class ExerciseTest < Minitest::Test
  attr_reader :value
  def test_nil
    @value = Value.new(nil).value
    assert_nil value
  end
end