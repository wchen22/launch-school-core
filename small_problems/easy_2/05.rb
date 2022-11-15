# Write a program that will ask for user's name. The program will then greet the user. If the user writes "name!" then the computer yells back to the user.

# Examples

# What is your name? Bob
# Hello Bob.

# What is your name? Bob!
# HELLO BOB. WHY ARE WE SCREAMING?

print "What is your name? "
name = gets.chomp
reply = name.end_with?('!') ? "HELLO #{name.upcase.chop}. WHY ARE WE SCREAMING?" : "Hello #{name}."
puts reply 

# Further Exploration
# Try modifying our solution to use String#chomp! and String#chop!, respectively.

print "What is your name? "
name = gets.chomp!
reply = name.end_with?('!') ? "HELLO #{name.upcase.chop!}. WHY ARE WE SCREAMING?" : "Hello #{name}."
puts reply 
