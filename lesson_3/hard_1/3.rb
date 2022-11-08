# In other practice problems, we have looked at how the scope of variables affects the modification of one "layer" when they are passed to another.

# To drive home the salient aspects of variable scope and modification of one scope by another, consider the following similar sets of code.

# What will be printed by each of these code groups?

def mess_with_vars_a(one, two, three)
  one = two
  two = three
  three = one
end

one = "one"
two = "two"
three = "three"

mess_with_vars_a(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"

# => one is: one
# => two is: two 
# => three is: three
# each of the variables initialized in the method are local variables and in turn assigned references to the values of a different argument, however once we exit the method scope they disappear and one two three are whatever they are outside of the method.

def mess_with_vars_b(one, two, three)
  one = "two"
  two = "three"
  three = "one"
end

one = "one"
two = "two"
three = "three"

mess_with_vars_b(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"

# => one is: one
# => two is: two 
# => three is: three
# Since everything performed within the method is reassignment, a new string is assigned to each local variable without modifying the original objects which the outer variables point to. 

def mess_with_vars_c(one, two, three)
  one.gsub!("one","two")
  two.gsub!("two","three")
  three.gsub!("three","one")
end

one = "one"
two = "two"
three = "three"

mess_with_vars_c(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"

# => one is: two
# => two is: three 
# => three is: one
# A mutating method String#gsub! is performed on the local method variables pointing to the same object as the outer variables, so when we print the outer variables, we get the modified objects.