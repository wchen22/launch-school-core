# Write a minitest assertion that will fail if the Array list is not empty.

require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'test_program'

class ExerciseTest < Minitest::Test
  def test_list_not_empty 
    list = Value.new('xyz').list
    assert_empty(list)
  end
end