# Alyssa was asked to write an implementation of a rolling buffer. Elements are added to the rolling buffer and if the buffer becomes full, then new elements that are added will displace the oldest elements in the buffer.

# She wrote two implementations saying, "Take your pick. Do you like << or + for modifying the buffer?". Is there a difference between the two, other than what operator she chose to use to add an element to the buffer?

def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element]
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

# Implementation 1 is destructive while 2 is non-destructive, since Array#<< is mutating while Array#+ isn't (it just returns a new array). Implementation 1 seems to make more sense, since we would expect to call this method more than once, the buffer array object would be modified with each call. 

# With implementation 2, we could still use it but we would have to assign the return value of each method call to a variable to have the current up to date buffer. 