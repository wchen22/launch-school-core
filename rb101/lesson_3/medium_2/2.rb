# Let's take a look at another example with a small difference in the code:

a = 42
b = 42
c = a

puts a.object_id
puts b.object_id
puts c.object_id

# Some object id number
# Same object id number since 42 is immutable. No need for integers to be stored in different memory addresses, since any operations will return a new integer object.
# Same object id number since it's referencing same object as a