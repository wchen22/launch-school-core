# # Group 1
# my_proc = proc { |thing| puts "This is a #{thing}." }
# puts my_proc
# puts my_proc.class
# my_proc.call
# my_proc.call('cat')

# =begin
# Guess: the proc method is called with a block as an argument and assigned to my_proc. The block takes an argument which is interpolated into a string and output.

# puts is called on my_proc, which will output the string representation of the Proc, which should call to_s.

# puts my_proc.class will print Proc.

# my_proc.call will call the Proc with no argument. Because Procs have lenient arity, 'thing' is assigned to `nil` and "This is a ." will be output.

# my_proc.call('cat) will output "This is a cat."
# =end

# system 'clear'


# # Group 2
# my_lambda = lambda { |thing| puts "This is a #{thing}." }
# my_second_lambda = -> (thing) { puts "This is a #{thing}." }
# puts my_lambda
# puts my_second_lambda
# puts my_lambda.class
# my_lambda.call('dog')
# #my_lambda.call # Throws error
# my_third_lambda = lambda { |thing| puts "This is a #{thing}." }
# my_fourth_lambda =  -> (thing) { puts "This is a #{thing}." }

# =begin
# The lambda keyword takes a block and returns a lambda object, which is assigned to my_lambda.  
# ?? Better to say atp, the lambda or the block takes an argument?

# This syntax for a lambda literal creates a lambda equivalent to the previous line.

# puts my_lambda will output a string representation of the lambda object.
# Same with my_second_lambda (different from 1st one)
# This will output 'Proc' since lambdas are instantiated from the Proc class.

# This will output "This is a dog." since the current # of arguments is provided.
# This will throw an ArgumentError b/c the lambda expects and requires 1 argument.

# This third lambda assignment will throw an error because no Lambda class
# =end

# system 'clear'
# # Group 3
# def block_method_1(animal)
#   yield
# end

# block_method_1('seal') { |seal| puts "This is a #{seal}."} # Method yields to the block without passing an argument. `seal` is set to nil, and the block "This is a ."
# block_method_1('seal') # Method is called without a block, a LocalJumpError will happen bc yield lacks a block to pass to.

# Group 4
def block_method_2(animal)
  yield(animal)
end

block_method_2('turtle') { |turtle| puts "This is a #{turtle}."}
block_method_2('turtle') do |turtle, seal|
  puts "This is a #{turtle} and a #{seal}."
end
block_method_2('turtle') { puts "This is a #{animal}."}

=begin
1) The method yields 'turtle', the block takes it and outputs "This is a turtle."
2) The method yields 'turtle', the block assigns it to the turtle local variable. B/c no second object is yielded, `seal` is assigned to `nil`. The output is "This is a turtle and a ."
3) The method yields 'turtle', the block is not defined to take an argument. A NameError will be thrown because there is no `animal` variable in scope.
=end