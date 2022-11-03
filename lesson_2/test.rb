# START
# Given two arrays a and b
# SET out to an empty array
# LOOP
# WHILE a.empty? is false
# PUSH a.shift to out
# WHILE b.empty? is false
# PUSH b.shift to out
# BREAK if both a.empty? and b.empty?
# PRINT/RETURN out

def merge(array_a, array_b)
  out = []
  loop do
    out << array_a.shift if array_a.empty? == false
    out << array_b.shift if array_b.empty? == false
    break if array_a.empty? && array_b.empty?
  end
  puts out
end

merge([1, 2, 3], [10, 20, 30, 40, 50])
