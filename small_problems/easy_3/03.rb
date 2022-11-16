# Counting the Number of Characters
# Write a program that will ask a user for an input of a word or multiple words and give back the number of characters. Spaces should not be counted as a character.

# input:
# Please write word or multiple words: walk
# output:
# There are 4 characters in "walk".

# input:
# Please write word or multiple words: walk, don't run
# output:
# There are 13 characters in "walk, don't run".

print "Please write word or multiple words: "
input = gets.chomp
# num_chars = input.split('').reject{|chars| chars == ' '}.size
num_chars = input.delete(' ').size
puts "There are #{num_chars} characters in \"#{input}\"."