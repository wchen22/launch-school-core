# Build a command line calculator program that does the following:
#     asks for two numbers
#     asks for the type of operation to perform: add, subtract, multiply or divide
#     displays the result

# Use the Kernel.gets() method to retrieve user input, and use Kernel.puts() method to display output. Remember that Kernel.gets() includes the newline, so you have to call chomp() to remove it: Kernel.gets().chomp().

# Get and store two numbers as integers
# Get the desired operation: add subtract multiply divide
# can use a case when to modify output based on operation

puts ">> Please enter your first number:"
n_1 = gets.chomp.to_f

puts ">> Please enter your second number:"
n_2 = gets.chomp.to_f

puts ">> What is the desired operation? (add, subtract, multiply, divide)"
operation = gets.chomp

answer = if operation == 'add'
            n_1 + n_2
          elsif operation == 'subtract'
            n_1 - n_2
          elsif operation == 'divide'
            n_1 / n_2
          elsif operation == ' multiply'
            n_1 * n_2
          end
puts answer
  

