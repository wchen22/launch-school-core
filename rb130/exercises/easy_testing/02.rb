# Write a minitest assertion that will fail if value.downcase does not return 'xyz'.

require 'minitest/autorun'

require_relative 'test_program'

class ExerciseTest < Minitest::Test
  attr_reader :value

  def setup
    @value = Value.new('xYZ')
  end

  def test_downcase
    assert_equal('xyz', value.downcase)
    refute_equal(@value.value, value.downcase)
  end
end