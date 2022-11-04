VALID_INPUT_MAP = {
  'r' => 'rock',
  'p' => 'paper',
  'sc' => 'scissors',
  'l' => 'lizard',
  'sp' => 'spock'
}

WINNING_MOVES = {
  rock: ['scissors', 'lizard'],
  paper: ['rock', 'spock'],
  scissors: ['paper', 'lizard'],
  lizard: ['spock', 'paper'],
  spock: ['scissors', 'rock']
}

def prompt(message)
  puts "=> #{message}"
end

def validate(choice)
  VALID_INPUT_MAP.any? { |first_chars, _full| choice.start_with?(first_chars) }
end

def return_full_choice(choice)
  VALID_INPUT_MAP.filter { |first_chars, _full| choice.start_with?(first_chars) }.values[0]
end

def win?(first, second)
  WINNING_MOVES[first.to_sym].include?(second)
end

def find_winner(player, computer)
  if win?(player, computer)
    'player'
  elsif win?(computer, player)
    'computer'
  else 'tie'
  end
end

def display_result(result, score)
  case result
  when 'player'
    ("You win! The score is Player: #{score[:user]}, Computer: #{score[:computer]}")
  when 'computer'
    prompt("You lose! The score is Player: #{score[:user]}, Computer: #{score[:computer]}")
  else prompt("It's a tie! The score is Player: #{score[:user]}, Computer: #{score[:computer]}")
  end
end

def update_score(score, result)
  case result
  when 'player' then score[:user] += 1
  when 'computer' then score[:computer] += 1
  end
end

loop do # main loop
  score = {
    user: 0,
    computer: 0
  }
  loop do # loop for each round
    user_choice = ''

    loop do # input and validation
      prompt("rock, paper, scissors, lizard, or spock?")
      user_choice = gets.chomp.strip.downcase
      if validate(user_choice)
        user_choice = return_full_choice(user_choice)
        break
      else
        prompt("That's not a valid option. Please try again.")
      end
    end

    computer_choice = VALID_INPUT_MAP.values.sample

    prompt("The computer goes with #{computer_choice}")

    result = find_winner(user_choice, computer_choice)

    update_score(score, result)

    display_result(result, score) # You win/lose! The score is Player: ___ Computer: ___

    if score.any? { |_player, points| points == 3 }
      grand_winner = score.filter { |_player, points| points == 3 }.keys[0]
      prompt("The overall winner is the #{grand_winner}!")
      break
    end

    prompt("Next round? y/n")
    break unless gets.chomp.downcase.start_with?('y')
  end

  prompt("Would you like to play again? y/n")
  break unless gets.chomp.downcase.start_with?('y')
end

prompt("Thanks for playing!")
