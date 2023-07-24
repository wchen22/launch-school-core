# What is the output of the following code?

answer = 42

def mess_with_it(some_number)
  some_number += 8
end

new_answer = mess_with_it(answer) # => 50

p answer - 8 # => 34, += is non-mutating so answer isn't changed with the method call. 
