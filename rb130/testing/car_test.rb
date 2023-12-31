require 'minitest/autorun'
# require 'minitest/reporters'
# Minitest::Reporters.use!

require_relative 'car'

class CarTest < Minitest::Test
  attr_reader :car

  def setup
    @car = Car.new
  end
  def test_car_exists
    assert(car)
  end

  def test_wheels
    assert_equal(4, car.wheels)
  end

  def test_name_is_nil
    assert_nil(car.name)
  end

  def test_raise_initialize_with_arg
    assert_raises(ArgumentError) do
      Car.new('arg')
    end
  end

  def test_instance_of_car
    assert_instance_of(Car, car)
  end

  def test_includes_car
    arr = [1, 2, 3]
    arr << car
    assert_includes(arr, car)
  end

  def test_value_equality
    car2 = Car.new
    car.name = 'Tesla'
    car2.name = 'Tesla'

    assert_equal(car, car2)
    assert_same(car, car2)
  end

end