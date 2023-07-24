# Write a method that takes an Array, and returns a new Array with the elements of the original list in reverse order. Do not modify the original list.

# You may not use Array#reverse or Array#reverse!, nor may you use the method you wrote in the previous exercise.

def reverse(array)
  new_array = []
  index = -1
  array.size.times do
    new_array << array[index]
    index -= 1
  end
  new_array
end

# Further Exploration
# An even shorter solution is possible by using either inject or each_with_object. Just for fun, read about these methods in the Enumerable module documentation, and try using one in your reverse method.

def reverse(array)
  array.each_with_object([]) { |element, array| array.unshift(element)}
end

def reverse(array)
  array.inject([]) { |array, element| array.prepend(element) }
end

# Examples:

p reverse([1,2,3,4]) == [4,3,2,1]          # => true
p reverse(%w(a b e d c)) == %w(c d e b a)  # => true
p reverse(['abc']) == ['abc']              # => true
p reverse([]) == []                        # => true

list = [1, 3, 2]                      # => [1, 3, 2]
new_list = reverse(list)              # => [2, 3, 1]
p list.object_id != new_list.object_id  # => true
p list == [1, 3, 2]                     # => true
p new_list == [2, 3, 1]                 # => true

