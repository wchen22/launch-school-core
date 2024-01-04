# Write a minitest assertion that will fail unless employee.hire raises a NoExperienceError exception.

require 'minitest/autorun'

require_relative 'test_program'

class ExerciseTest < Minitest::Test
  attr_reader :employee
  def setup
    @employee = Value.new('employee')
  end
  def test_hire_error
    assert_raises NoExperienceError do
      employee.hire
    end
  end
end