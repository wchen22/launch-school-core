# Write a method that takes one argument, a positive integer, and returns a string of alternating 1s and 0s, always starting with 1. The length of the string should match the given integer.

def stringy(int)
  out = '10' * (int/2)
  out += '1' if int.odd?
  out
end

# Examples:
puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'
# The tests above should print true.

def stringy(int)
  output = ''
  int.times do |index|
    output << (index.even? ? '1' : '0')
  end
  output
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'

# Further Exploration
# Modify stringy so it takes an additional optional argument that defaults to 1. If the method is called with this argument set to 0, the method should return a String of alternating 0s and 1s, but starting with 0 instead of 1.

def stringy(int, start = 1)
  output = []
  int.times do |index|
    current = index.even? ? start : 1-start
    output << current
  end
  output.join
end

puts stringy(6)
puts stringy(6, 0)
puts stringy(11)
puts stringy(11, 0)