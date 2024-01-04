# Ruby gives us a lot of flexibility when assigning arrays to variables. If we want to assign the entire array to a single variable, we can do that:

birds = %w(raven finch hawk eagle)
p birds # => ['raven','finch','hawk','eagle']

# If we want to assign every element to a separate variable, we can do that too:

raven, finch, hawk, eagle = %w(raven finch hawk eagle)
p raven # => 'raven'
p finch # => 'finch'
p hawk # => 'hawk'
p eagle # => 'eagle'

# Suppose we want to organize our array contents into groups, where variables represent category names. Can we do that without extracting items directly from the array based on their indices?

# We can use the splat operator(*) to do something like this:

raven, finch, *raptors = %w(raven finch hawk eagle)
p raven # => 'raven'
p finch # => 'finch'
p raptors  # => ['hawk','eagle']

# Based on the examples shown above, write a method that takes an array as an argument. The method should yield the contents of the array to a block, which should assign your block parameters in such a way that it ignores the first two elements, and groups all remaining elements as a raptors array.

def find_raptors(array)
  yield(array) if block_given?
end

p find_raptors(birds) { |array| array[2..-1]}

def find_raptors(array)
  raptors_array = []
  array.each_with_index { |bird, idx| raptors_array << bird if yield(bird, idx) && block_given?}
  raptors_array
end

p find_raptors(birds) { |bird, idx| idx > 1 }

def find_raptors(array)
  yield(array) if block_given?
end

p find_raptors(birds) { |array|
  bird1, bird2, *raptors = array
  raptors
}

find_raptors(birds) { |_, _, *raptors| puts "Raptors: #{raptors.join(', ')}"}