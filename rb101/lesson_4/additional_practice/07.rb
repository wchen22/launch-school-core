# Create a hash that expresses the frequency with which each letter occurs in this string:

statement = "The Flintstones Rock"

# ex:

# { "F"=>1, "R"=>1, "T"=>1, "c"=>1, "e"=>2, ... }

frequency1 = Hash.new(0)

statement.delete(' ').each_char do |letter|
  frequency1[letter] += 1
end

p frequency1

# Another approach
frequency2 = {}
letters = ('a'..'z').to_a + ('A'..'Z').to_a
letters.each do |letter|
  count = statement.count(letter)
  frequency2[letter] = count if count > 0
end
p frequency2

p frequency1 == frequency2