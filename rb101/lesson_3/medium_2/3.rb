# Let's call a method, and pass both a string and an array as arguments and see how even though they are treated in the same way by Ruby, the results can be different.

# Study the following code and state what will be displayed...and why:

def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}" 
# My array looks like this now: pumpkins
# When we pass my_string into the method, what gets passed is a reference to the original string. However, String#+= is re-assignment and creates a new String object that is assigned to the method variable a_string_param. The my_string in outside scope remains unchanged.
# We could instead use String#<< which IS mutating and make a change to the string which both inner and outer variables point to, thus printing "pumpkinsrutabaga".


puts "My array looks like this now: #{my_array}" 
# My array looks like this now: ["pumpkins", "rutabaga"]
# When we pass my_array into the method, a new local variable an_array_param is assigned a reference to the outer scope my_array. Array objects can have any number of elements (i.e. are mutable), and so Array#<< operation mutates the original array which both the method variable and main variable point to, so the change is reflected in the array outside the method as well.