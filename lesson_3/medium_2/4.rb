# To drive that last one home...let's turn the tables and have the string show a modified output, while the array thwarts the method's efforts to modify the user's version of it.

def tricky_method_two(a_string_param, an_array_param)
  a_string_param << 'rutabaga'
  an_array_param = ['pumpkins', 'rutabaga']
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method_two(my_string, my_array)

puts "My string looks like this now: #{my_string}"
# will output pumpkinsrutabaga since we now use the String#<< operation which is mutating. a_string_param and my_string both point to the same object "pumpkins", which becomes "pumpkinsrutabaga".
puts "My array looks like this now: #{my_array}"
# will output ["pumpkins"], since inside the method we are trying to assign the newly initialized local varaible an_array_param an entirely new array object instead of doing something mutative like indexed assignment or appending to it. 