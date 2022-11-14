# Using the each method, write some code to output all of the vowels from the strings.

hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

vowels = 'aeiou'

hsh.each_value do |strings|
  strings.each do |word|
    word.chars.each do |char|
      puts char if vowels.include?(char.downcase)
    end
  end
end