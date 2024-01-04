# Write a test that will fail if list and the return value of list.process are different objects.

require 'minitest/autorun'

require_relative 'test_program'

class ExerciseTest < Minitest::Test
  attr_reader :list
  
  def setup
    @list = Value.new(1)
  end
  
  def test_list_vs_list_process_same_object?
    assert_same list, list.process
  end
end