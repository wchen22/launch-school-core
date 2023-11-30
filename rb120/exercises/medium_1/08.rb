# Update this class so you can use it to determine the lowest ranking and highest ranking cards in an Array of Card objects:

require 'pry'

class Card
  include Comparable
  attr_reader :rank, :suit
  RANK_ORDER = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King', 'Ace']

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def to_s
    "#{rank} of #{suit}"
  end

  def <=>(other_card)
    #binding.pry
    RANK_ORDER.index(rank) <=> RANK_ORDER.index(other_card.rank)
  end
end

# numeric cards are low cards, 2-10. 10 < J < Q < K < A. Suits don't matter

cards = [Card.new(2, 'Hearts'),
  Card.new(10, 'Diamonds'),
  Card.new('Ace', 'Clubs')]
puts cards
puts cards.min == Card.new(2, 'Hearts')
puts cards.max == Card.new('Ace', 'Clubs')

cards = [Card.new(5, 'Hearts')]
puts cards.min == Card.new(5, 'Hearts')
puts cards.max == Card.new(5, 'Hearts')

cards = [Card.new(4, 'Hearts'),
  Card.new(4, 'Diamonds'),
  Card.new(10, 'Clubs')]
puts cards.min.rank == 4
puts cards.max == Card.new(10, 'Clubs')

cards = [Card.new(7, 'Diamonds'),
  Card.new('Jack', 'Diamonds'),
  Card.new('Jack', 'Spades')]
puts cards.min == Card.new(7, 'Diamonds')
puts cards.max.rank == 'Jack'

cards = [Card.new(8, 'Diamonds'),
  Card.new(8, 'Clubs'),
  Card.new(8, 'Spades')]
puts cards.min.rank == 8
puts cards.max.rank == 8

=begin
Further Exploration

Assume you're playing a game in which cards of the same rank are unequal. In such a game, each suit also has a ranking. Suppose that, in this game, a 4 of Spades outranks a 4 of Hearts which outranks a 4 of Clubs which outranks a 4 of Diamonds. A 5 of Diamonds, though, outranks a 4 of Spades since we compare ranks first. Update the Card class so that #min and #max pick the card of the appropriate suit if two or more cards of the same rank are present in the Array.

=end

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
    RANK_ORDER.index(rank)
  end

  def suit_value
    SUIT_ORDER.index(suit)
  end

  def <=>(other_card)
    value_comparison = (value <=> other_card.value)

    case value_comparison
    when 0 then suit_value <=> other_card.suit_value
    else value_comparison
    end

  end
end

cards = [Card.new(2, 'Clubs'),
  Card.new(10, 'Diamonds'),
  Card.new(2, 'Hearts')]

puts cards.min != Card.new(2, 'Hearts')
puts cards.min == Card.new(2, 'Clubs')


