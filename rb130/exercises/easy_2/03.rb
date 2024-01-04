# map
# Let's return to implementing existing core ruby methods to learn about blocks.

# The Enumerable#map method iterates over the members of a collection, using the associated block to perform some sort of operation on each collection member. The returned values from the block are then built up into an Array that is then returned to the caller. Note in particular that every time #map yields to the block, it obtains just one value. That value may be a complex value - it may even be another collection - but it is nevertheless just one value. Thus, #map returns an Array that has the same number of elements that the original collection had.

# Write a method called map that behaves similarly for Arrays. It should take an Array as an argument, and a block. It should return a new Array that contains the return values produced by the block for each element of the original Array.

# If the Array is empty, map should return an empty Array, regardless of how the block is defined.

# Your method may use #each, #each_with_object, #each_with_index, #reduce, loop, for, while, or until to iterate through the Array passed in as an argument, but must not use any other methods that iterate through an Array or any other collection.

def map(collection)
  collection.each_with_object([]) {|item, mapped_array| mapped_array << yield(item)}
end
 
# Examples:

p map([1, 3, 6]) { |value| value**2 } == [1, 9, 36]
p map([]) { |value| true } == []
p map(['a', 'b', 'c', 'd']) { |value| false } == [false, false, false, false]
p map(['a', 'b', 'c', 'd']) { |value| value.upcase } == ['A', 'B', 'C', 'D']
p map([1, 3, 4]) { |value| (1..value).to_a } == [[1], [1, 2, 3], [1, 2, 3, 4]]

p map({ a: 1, b: 2, c: 3}) { |key, value| "#{key}: #{value * 10}" } == ["a: 10", "b: 20", "c: 30"] # The method yields a 2 element array with each key-value pair (e.g. [:a, 1]), so two arguments correctly deconstructs the yielded array

p map({ a: 1, b: 2, c: 3}) { |item| p item.class; item } == [[:a, 1], [:b, 2], [:c, 3]] # Using a single parameter lets us see what our method is yielding at each iteration

p map({ a: 1, b: 2, c: 3}) { |key, value, something| [key, value, something] } == [[:a, 1, nil], [:b, 2, nil], [:c, 3, nil]] # Using extra parameters is allowed, Ruby just assigns them to nil 