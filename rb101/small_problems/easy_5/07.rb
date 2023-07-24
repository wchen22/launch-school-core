# Modify the word_sizes method from the previous exercise to exclude non-letters when determining word size. For instance, the length of "it's" is 3, not 4.

def word_sizes(sentence)
  frequencies = Hash.new(0)
  sentence.split.each do |word| 
    size = 0
    word.each_char do |char|
      size += 1 if ('a'..'z').include?(char.downcase)
    end
    frequencies[size] += 1 
  end
  frequencies
end

def word_sizes(sentence)
  frequencies = Hash.new(0)
  sentence.split.each do |word| 
    size = word.count('A-Za-z')
    frequencies[size] += 1 
  end
  frequencies
end

# Examples

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes('') == {}