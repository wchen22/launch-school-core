# Print all odd numbers from 1 to 99, inclusive, to the console, with each number on a separate line.

# for i in (1..99) do
#   puts i if i.odd?
# end

# while method

# number = 1
# while number <= 99
#   puts number
#   number += 2
# end

# Integer#upto

# 1.upto(99) do |i|
#   puts i if i.odd?
# end

# Array#select

# puts (1..99).to_a.select { |n| n.odd? }

# Array#map
puts (1..50).to_a.map { |n| n * 2 - 1 }
