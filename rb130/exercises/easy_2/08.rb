# The Enumerable#max_by method iterates over the members of a collection, passing each element to the associated block. It then returns the element for which the block returned the largest value.

# Write a method called max_by that behaves similarly for Arrays. It should take an Array and a block, and return the element that contains the largest value.

# If the Array is empty, max_by should return nil.

# Your method may use #each, #each_with_object, #each_with_index, #reduce, loop, for, while, or until to iterate through the Array passed in as an argument, but must not use any other methods that iterate through an Array or any other collection.
require 'pry'
def max_by(array)
  largest = array.first
  array.each do |item|
    largest = item if yield(item) > yield(largest)
  end
  largest
end

def max_by(array)
  return nil if array.empty?

  array.each_with_object([array.first, yield(array.first)]) {|item, obj| 
    current_yield = yield(item)
    obj[0], obj[1] = item, current_yield if current_yield > obj[1]
  }.first
end

def max_by(array)
  return nil if array.empty?
  current_leader = { max_element: array.first,
                     max_value: yield(array.first)
                   }

  array.each_with_object(current_leader) {|item, hash| 
    current_yield = yield(item)
    hash[:max_element], hash[:max_value] = item, current_yield if current_yield > hash[:max_value]
  }[:max_element]
end

# Examples:

p max_by([1, 5, 3]) { |value| value + 2 } == 5
p max_by([1, 5, 3]) { |value| 9 - value } == 1
p max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
p max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
p max_by([-7]) { |value| value * 3 } == -7
p max_by([]) { |value| value + 5 } == nil