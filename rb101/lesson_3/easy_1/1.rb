# What would you expect the code below to print out?

numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers

# Since Array#uniq is non-destructive, the output should be 1, 2, 2, 3 on separate lines.