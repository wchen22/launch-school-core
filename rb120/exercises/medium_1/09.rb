# Using the Card class from the previous exercise, create a Deck class that contains all of the standard 52 playing cards. Use the following code to start your work:

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

class Deck
  RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze

  attr_accessor :cards

  def initialize
    @cards = []
    reset
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

  def draw
    reset if cards.empty?
    cards.pop
  end

  # The Deck class should provide a #draw method to deal one card. The Deck should be shuffled when it is initialized and, if it runs out of cards, it should reset itself by generating a new set of 52 shuffled cards.


end

deck = Deck.new
drawn = []
52.times { drawn << deck.draw }
puts drawn.count { |card| card.rank == 5 } == 4
puts drawn.count { |card| card.suit == 'Hearts' } == 13

drawn2 = []
52.times { drawn2 << deck.draw }
puts drawn != drawn2 # Almost always.