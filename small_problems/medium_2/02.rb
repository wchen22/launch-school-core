# Now I Know My ABCs
# A collection of spelling blocks has two letters per block, as shown in this list:

# B:O   X:K   D:Q   C:P   N:A
# G:T   R:E   F:S   J:W   H:U
# V:I   L:Y   Z:M
# This limits the words you can spell with the blocks to just those words that do not use both letters from any given block. Each letter in each block can only be used once.

# Write a method that returns true if the word passed in as an argument can be spelled from this set of blocks, false otherwise.

PAIRS = %w(B X D C N G R F J H V L Z).zip(%w(O K Q P A T E S W U I Y M)).to_h

def block_word?(word)
  word.each_char do |char|
    if PAIRS.has_key?(char.upcase)
      if word.upcase.include?(PAIRS[char.upcase])
        return false
      elsif word.count(char) >= 2
        return false
      end
    end
  end
  true
end
# Examples:

p block_word?('BATCH') == true
p block_word?('BBATCH') == false
p block_word?('BUTCH') == false
p block_word?('jest') == true