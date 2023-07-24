require 'pry'

TOTAL_LIMIT = 21
DEALER_THRESHOLD = 17
GAMES_TO_WIN = 2

def prompt(msg)
  puts "=> #{msg}"
end

def create_deck
  deck = []
  suits = ['D', 'C', 'H', 'S']
  values = (2..10).to_a.push('J', 'Q', 'K', 'A') * 4

  values.each_with_index do |value, index|
    deck << [suits[index / 13], value]
  end

  deck
end

def total(hand)
  values = hand.map do |card|
    value = card[1]
    if value.to_i > 0
      value.to_i
    elsif value == 'A'
      11
    else 10
    end
  end

  sum = values.sum
  ace_count = hand.count { |card| card[1] == 'A' }

  while sum > TOTAL_LIMIT && ace_count > 0
    sum -= 10
    ace_count -= 1
  end

  sum
end

def deal!(hand, deck)
  card = deck.delete_at(rand(deck.length))
  prompt("Dealing next card")
  hand << card
  sleep(0.3)
end

def find_winner(player_sum, dealer_sum)
  return 'dealer' if player_sum > TOTAL_LIMIT
  return 'player' if dealer_sum > TOTAL_LIMIT
  case player_sum <=> dealer_sum
  when -1 then 'dealer'
  when 0 then 'tie'
  when 1 then 'player'
  end
  # return value should be 'player' 'dealer' or 'tie
end

def announce_winner(winner)
  sleep(0.5)
  prompt case winner
         when 'player' then 'You won!'
         when 'dealer' then 'The dealer won!'
         when 'tie' then "It's a tie!"
         end
  sleep(0.5)
end

def grand_summary(totals, scores)
  player_total = totals['player']
  dealer_total = totals['dealer']
  prompt "Your final total is #{player_total}. The dealer's is #{dealer_total}"

  winner = find_winner(player_total, dealer_total)
  announce_winner(winner)

  scores[winner] += 1

  grand_winner = scores.select { |_player, score| score == GAMES_TO_WIN }.keys[0]

  if grand_winner
    prompt "Game over! #{grand_winner.capitalize} won #{GAMES_TO_WIN} games."
    scores['player'] = 0
    scores['dealer'] = 0
  end
end

scores = Hash.new(0)

loop do
  system 'clear'
  deck = create_deck
  totals = Hash.new(0)
  player_hand = []
  dealer_hand = []

  prompt "Welcome to #{TOTAL_LIMIT}"
  prompt "|Score| Player: #{scores['player']} | Dealer: #{scores['dealer']}. First to #{GAMES_TO_WIN} wins"
  prompt "Dealing cards..."

  2.times do
    deal!(player_hand, deck)
    deal!(dealer_hand, deck)
  end

  prompt "Your hand is: #{player_hand}"
  prompt "One of the dealer's cards is #{dealer_hand[0]}"

  totals['player'] = total(player_hand)
  totals['dealer'] = total(dealer_hand)

  p "Player sum is #{totals['player']}"

  # Player turn
  loop do
    prompt "(h)it or (s)tay?"
    answer = gets.chomp

    if !%w(h s).include? answer.downcase[0]
      prompt "That's not valid. Please enter 'h' or 's'."
      next
    end

    break if answer.downcase.start_with?('s')
    deal!(player_hand, deck)
    p player_hand
    totals['player'] = total(player_hand)
    p "Player sum is #{totals['player']}"
    break if totals['player'] > TOTAL_LIMIT
  end

  if totals['player'] > TOTAL_LIMIT
    prompt "You busted!"
    grand_summary(totals, scores)
    prompt("Play again? (y or n)")
    answer = gets.chomp
    next if answer.downcase.start_with?('y')
    prompt "Thanks for playing!"
    break
  end

  # Dealer turn
  prompt "It's the dealer's turn"

  totals['dealer'] = total(dealer_hand)

  prompt "The dealer's hand is... #{dealer_hand} for a sum of #{totals['dealer']}"

  loop do
    if totals['dealer'] >= DEALER_THRESHOLD
      prompt "The dealer stays."
      break
    end

    prompt "The dealer hits."
    deal!(dealer_hand, deck)

    totals['dealer'] = total(dealer_hand)
    p dealer_hand
    p "Dealer sum is #{totals['dealer']}"
    break if totals['dealer'] > TOTAL_LIMIT
  end

  if totals['dealer'] > TOTAL_LIMIT
    prompt "The dealer busted!"
    grand_summary(totals, scores)

    prompt("Play again? (y or n)")
    answer = gets.chomp
    next if answer.downcase.start_with?('y')

    prompt "Thanks for playing!"
    break
  end

  grand_summary(totals, scores)

  prompt "Play again? (y or n)"
  if gets.chomp.downcase.start_with?('n')
    prompt "Thanks for playing!"
    break
  end
end
