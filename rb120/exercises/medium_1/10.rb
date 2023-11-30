# In the previous two exercises, you developed a Card class and a Deck class. You are now going to use those classes to create and evaluate poker hands. Create a class, PokerHand, that takes 5 cards from a Deck of Cards and evaluates those cards as a Poker hand. If you've never played poker before, you may find this overview of poker hands useful.

# You should build your class using the following code skeleton:

# Include Card and Deck classes from the last two exercises.

require 'pry'

class Card
  include Comparable
  attr_reader :rank, :suit
  RANK_ORDER = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King', 'Ace']
  SUIT_ORDER = ['Diamonds', 'Clubs', 'Hearts', 'Spades']

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def to_s
    "#{rank} of #{suit}"
  end

  def value
    RANK_ORDER.index(rank) + 2
  end

  def suit_value
    SUIT_ORDER.index(suit) + 1
  end

  def <=>(other_card)
    value_comparison = (value <=> other_card.value)

    case value_comparison
    when 0 then suit_value <=> other_card.suit_value
    else value_comparison
    end

  end
end

class Deck
  RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze

  attr_accessor :cards

  def initialize
    @cards = []
    reset
  end

  def draw(number)
    reset if cards.empty?
    cards.pop(number)
  end

  private
  
  def reset
    RANKS.each do |rank|
      SUITS.each do |suit|
        cards << Card.new(rank, suit)
      end
    end

    cards.shuffle!
  end

end

class PokerHand
  attr_reader :hand, :hand_ranks, :hand_suits
  def initialize(deck)
    @hand = deck.draw(5)
    @hand_ranks = hand.map { |card| card.rank}.uniq
    @hand_suits = hand.map { |card| card.suit}.uniq

  end

  def print
    puts hand
  end

  def evaluate
    case
    when royal_flush?     then 'Royal flush'
    when straight_flush?  then 'Straight flush'
    when four_of_a_kind?  then 'Four of a kind'
    when full_house?      then 'Full house'
    when flush?           then 'Flush'
    when straight?        then 'Straight'
    when three_of_a_kind? then 'Three of a kind'
    when two_pair?        then 'Two pair'
    when pair?            then 'Pair'
    else                       'High card'
    end
  end

  private

  def count_rank(rank)
    hand.count { |card| card.rank == rank}
  end

  def royal_flush?
    straight_flush? && hand_ranks.include?('Ace')
  end

  def straight_flush?
    straight? && flush?
  end

  def four_of_a_kind?
    hand_ranks.any? { |rank| count_rank(rank) == 4}
  end

  def full_house?
    three_of_a_kind? && pair?
  end

  def flush?
    hand_suits.size == 1
  end

  def straight?
    hand_values = hand.map {| card| card.value }.sort
    hand_ranks.size == 5 && hand_values.sum == hand_values[2] * 5
  end

  def three_of_a_kind?
    hand_ranks.any? { |rank| count_rank(rank) == 3 }
  end

  def two_pair?
    hand_ranks.size == 3 && pair?
  end

  def pair?
    hand_ranks.any? { |rank| count_rank(rank) == 2}
  end
end

# Testing your class:

hand = PokerHand.new(Deck.new)
hand.print
puts hand.evaluate

# Danger danger danger: monkey
# patching for testing purposes.

class Array
  alias_method :draw, :pop
end

# Test that we can identify each PokerHand type.
hand = PokerHand.new([
  Card.new(10,      'Hearts'),
  Card.new('Ace',   'Hearts'),
  Card.new('Queen', 'Hearts'),
  Card.new('King',  'Hearts'),
  Card.new('Jack',  'Hearts')
])
puts hand.evaluate == 'Royal flush'

hand = PokerHand.new([
  Card.new(8,       'Clubs'),
  Card.new(9,       'Clubs'),
  Card.new('Queen', 'Clubs'),
  Card.new(10,      'Clubs'),
  Card.new('Jack',  'Clubs')
])
puts hand.evaluate == 'Straight flush'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(3, 'Diamonds')
])
puts hand.evaluate == 'Four of a kind'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(5, 'Hearts')
])
puts hand.evaluate == 'Full house'

hand = PokerHand.new([
  Card.new(10, 'Hearts'),
  Card.new('Ace', 'Hearts'),
  Card.new(2, 'Hearts'),
  Card.new('King', 'Hearts'),
  Card.new(3, 'Hearts')
])
puts hand.evaluate == 'Flush'

hand = PokerHand.new([
  Card.new(8,      'Clubs'),
  Card.new(9,      'Diamonds'),
  Card.new(10,     'Clubs'),
  Card.new(7,      'Hearts'),
  Card.new('Jack', 'Clubs')
])
puts hand.evaluate == 'Straight'

hand = PokerHand.new([
  Card.new('Queen', 'Clubs'),
  Card.new('King',  'Diamonds'),
  Card.new(10,      'Clubs'),
  Card.new('Ace',   'Hearts'),
  Card.new('Jack',  'Clubs')
])
puts hand.evaluate == 'Straight'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(6, 'Diamonds')
])
puts hand.evaluate == 'Three of a kind'

hand = PokerHand.new([
  Card.new(9, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(8, 'Spades'),
  Card.new(5, 'Hearts')
])
puts hand.evaluate == 'Two pair'

hand = PokerHand.new([
  Card.new(2, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(9, 'Spades'),
  Card.new(3, 'Diamonds')
])
puts hand.evaluate == 'Pair'

hand = PokerHand.new([
  Card.new(2,      'Hearts'),
  Card.new('King', 'Clubs'),
  Card.new(5,      'Diamonds'),
  Card.new(9,      'Spades'),
  Card.new(3,      'Diamonds')
])
puts hand.evaluate == 'High card'

=begin 

Further Exploration
The following questions are meant to be thought exercises; rather than write code, think about what you would need to do. Feel free to write some code after thinking about the problem.

How would you modify this class if you wanted the individual classification methods (royal_flush?, straight?, three_of_a_kind?, etc) to be public class methods that work with an Array of 5 cards, e.g.,

def self.royal_flush?(cards)
  ...
end

-> Would be called like PokerHand.royal_flush?(hand.cards). Would need class methods for each of the hand types. Would also want a class method that takes in an array and returns the count of ranks and/or suits, as a hash or an array.

How would you modify our original solution to choose the best hand between two poker hands?

-> Include the Comparable module and then define a <=>(other_hand) method. 
-> If they're the same type, we need to look for the highest relevant suit. 
-> Otherwise, we can compare the return value of evalute? on the hand. We'd need to order the hands in a constant like HAND_HIERARCHY = ['Royal flush', 'Straight flush', 'Four of a kind'...]. Then we can use compare the integer index of the hand type and use the return value of Integer#<=>.

How would you modify our original solution to choose the best 5-card hand from a 7-card poker hand?

-> Helper function that generates all 5-card combinations
  -> Call max_by, passing into the block each combination. The criteria for max is the return value of evaluate? on the current combination. This will rely on implementing a <=> operator for a Hand object as detailed above.

  -> OR iterate through HAND_HIERARCHY
    -> And for each type of hand, see if any of the hand combinations evaluate to that type
    -> Short circuit and return the current hand combination when the above is true

=end