# String Assignment
# Take a look at the following code:

name = 'Bob'
save_name = name
name = 'Alice'
puts name, save_name

#What does this code print out? Think about it for a moment before continuing.

# Alice
# Bob
# The third line reassigns the variable name to a new object 'Alice', save_name remains pointed at 'Bob'.

# If you said that code printed
# Alice
# Bob
# you are 100% correct, and the answer should come as no surprise. Now, let's look at something a bit different:

name = 'Bob'
save_name = name
name.upcase!
puts name, save_name

# What does this print out? Can you explain these results?
# BOB
# BOB
# Here, line 3 mutates the object it's called on, the string 'Bob'. 
# In Ruby, assignment just assigns a reference to a variable, so name and save_name both refer to the same object. When we call upcase! on the name object, the object both variables point to is mutated, so both will now refer to the updated object 'BOB'.