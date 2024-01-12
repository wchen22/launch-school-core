# Write a program that takes a word and a list of possible anagrams and selects the correct sublist that contains the anagrams of the word.

# For example, given the word "listen" and a list of candidates like "enlists", "google", "inlets", and "banana", the program should return a list containing "inlets". Please read the test suite for the exact rules of anagrams.

# return an array always, even for no matches. Doesn't have to be sorted. the same word doesn't count. case doesn't matter


def test_detect_simple_anagram
  skip
  detector = Anagram.new('ant')
  anagrams = detector.match(%w(tan stand at))
  assert_equal ['tan'], anagrams
end

class Anagram
  def initialize(string)
    @word = string
  end

  def match(candidates)
    candidates.select do |candidate|
      word1 = @word.downcase
      word2 = candidate.downcase
      word1 != word2 && word1.chars.sort == word2.chars.sort
    end
  end
end