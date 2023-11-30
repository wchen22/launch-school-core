# Write a description of the problem and extract major nouns and verbs.
# Make an initial guess at organizing the verbs into nouns and do a spike to explore the problem with temporary code.
# Optional - when you have a better idea of the problem, model your thoughts into CRC cards.

=begin
Twenty one description
- A game where the dealer and the player are dealt two cards from a standard deck of playing cards to start
- The player can see their cards and one of the dealer's cards at all times.
- Each turn,
  - the player decides to stay or hit
    - If they hit, they get another card
  - the dealer hits unless cards add up to at least 17
  - If neither hit, whoever has the highest total wins. It's a tie if they're the same
  - Whenever either player gets a card, if the sum of the hand exceeds 21 they lose
  - Cards are worth 1-10, 10 for JQK, and 1 OR 10 for Ace's

Major nouns and verbs
  -Participants
    -Dealer
    -Player
  -Hand
    -Cards
    -Total
  -Deck
    -Cards

  -Game

  Verbs
  -Deal
  -Hit
  -Stay
  -Bust

Spike
Participant
- Hit
- Stay
- @hand
- calculate_total
- busted?
- name
< Player
< Dealer
- deal (here or in deck?)

Deck
- Cards
- deal (here or in Dealer?)

Game
- play
=end

require 'pry'
class Participant
  attr_accessor :hand, :name

  def initialize
    @hand = []
  end

  def hit; end

  def stay; end

  def calculate_totals
    totals = [0]
    hand.each do |card|
      if card.values.size > 1
        first_set = totals.map { |total| total + 1 }
        second_set = totals.map { |total| total + 10 }
        totals = first_set + second_set
      else
        totals.map! { |total| total + card.values[0] }
      end
    end

    totals
  end

  def busted?
    hand_total_greater_than?(21)
  end

  def hand_total_greater_than?(value)
    calculate_totals.all? { |total| total > value }
  end

  def display_cards
    hand.each do |card|
      print "[#{card.rank} of #{card.suit}] "
    end
  end
end

class Player < Participant
end

class Dealer < Participant
  def display_cards(hidden = true)
    if hidden
      first_card = hand[0]
      print "#{first_card.rank} of #{first_card.suit}"
      hand[1..-1].each { |_card| print " hidden card" }
    else
      super()
    end
  end
end

class Deck
  attr_reader :cards

  def initialize
    @cards = []
    Card::SUITS.each do |suit|
      Card::RANKS.each do |type|
        @cards << Card.new(suit, type)
      end
    end
  end

  def deal(player)
    player.hand << @cards.delete(@cards.sample)
  end
end

class Card
  attr_accessor :suit, :rank

  SUITS = ['Diamonds', 'Clubs', 'Hearts', 'Spades']
  RANKS = %w(Ace 2 3 4 5 6 7 8 9 10 Jack Queen King)

  def initialize(suit, rank)
    @suit = suit
    @rank = rank
  end

  def values
    if %w(Jack Queen King).include?(rank)
      [10]
    elsif rank == 'Ace'
      [1, 10]
    else
      [rank.to_i]
    end
  end
end

class TwentyOneGame
  attr_accessor :deck, :human, :dealer

  def initialize
    @deck = Deck.new
    @human = Player.new
    @dealer = Dealer.new
    deal_initial_hands
  end

  def deal_initial_hands
    2.times do
      deal(human)
      deal(dealer)
    end
  end

  def deal(participant)
    participant.hand << deck.cards.delete(deck.cards.sample)
  end

  def player_turn
    answer = nil
    loop do
      puts "1) Hit or 2) stay?"
      answer = gets.chomp
      break if %w(1 2).include?(answer)
      puts "Sorry invalid choice. Please enter 1 or 2."
    end

    return unless answer == '1'
    deal(human)
  end

  def dealer_turn
    if dealer.hand_total_greater_than?(16)
      # stay
    else
      deal(dealer)
    end
  end

  def joinor(array)
    "#{array[0...-1].join(', ')} or #{array.last}"
  end

  def display_human_score
    if human.calculate_totals.size > 1
      puts "Your score is #{joinor(human.calculate_totals)}"
    else
      puts "Your score is #{human.calculate_totals.first}"
    end
  end

  def display_board(hidden = true)
    system 'clear'
    human.display_cards
    display_human_score
    puts
    dealer.display_cards(hidden)
    puts
  end

  def player_hit?
    answer = nil
    loop do
      puts "1) Hit or 2) stay?"
      answer = gets.chomp
      break if %w(1 2).include?(answer)
      puts "Sorry invalid choice. Please enter 1 or 2."
    end
    answer == '1'
  end

  def dealer_hit?
    !dealer.hand_total_greater_than?(16)
  end

  def announce_winner
    if human.busted?
      puts "You busted! Dealer won"
    elsif dealer.busted?
      puts "Dealer busted! You won!"
    else
      winner = [human, dealer].max_by do |player|
        player.calculate_totals.select { |total| total < 22 }.max
      end
      p winner == human
    end
  end

  def main_game
    loop do
      display_board
      stay_count = 0
      if player_hit?
        deal(human)
        break if human.busted?
      else
        stay_count += 1
      end

      if dealer_hit?
        deal(dealer)
        break if dealer.busted?
      else
        stay_count += 1
      end

      if stay_count == 2
        puts "You both stayed! Score: #{human.calculate_totals}, Dealer: #{dealer.calculate_totals}"
        break
      end
    end
  end

  def play
    main_game
    display_board(false)
    announce_winner

    puts "Thanks for playing! "
  end
end

new_game = TwentyOneGame.new
new_game.play
