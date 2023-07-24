# The following code:

def my_method(array)
  if array.empty?
    []
  elsif array.size > 1 # The bug was there was initially a missing elsif condition here
    array.map do |value| 
      value * value
    end
    # The reason the function returns nil in the last 3 calls is that elsif actually uses array.map... as the condition. And since array.map returns an array if the array on which it is called is non-empty, this is always truthy. So the code takes the elsif path...but after the condition, there is no more code to execute, which returns nil.

  else
    [7 * array.first]
  end
end

p my_method([])
p my_method([3])
p my_method([3, 4])
p my_method([5, 6, 7])

# is expected to print:

# []
# [21]
# [9, 16]
# [25, 36, 49]
# However, it does not. Obviously, there is a bug. Find and fix the bug, then explain why the buggy program printed the results it did.