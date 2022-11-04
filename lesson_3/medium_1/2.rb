# The result of the following statement will be an error:

# puts "the value of 40 + 2 is " + (40 + 2)

# Why is this and what are two possible ways to fix this?

# Can't coerce int 42 into string, need to convert it to a string first with .to_s before concatenating it. Or use string interpolation.

puts "the value of 40 + 2 is " + (40 + 2).to_s