require 'pry'

BLANK_MARK = " "
PLAYER_MARK = "X"
COMPUTER_MARK = "O"
GAMES_TO_WIN = 3
WIN_COMBOS = [
  [1, 2, 3],
  [4, 5, 6],
  [7, 8, 9],
  [1, 4, 7],
  [2, 5, 8],
  [3, 6, 9],
  [1, 5, 9],
  [7, 5, 3]
]

def prompt(text)
  puts "=> #{text}"
end

def display_board(brd)
  system 'clear'
  puts ""
  puts "#{PLAYER_MARK} = Player, #{COMPUTER_MARK} = Computer"
  puts ""
  puts "     |     |     "
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}  "
  puts "     |     |     "
  puts "-----+-----+-----"
  puts "     |     |     "
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}  "
  puts "     |     |     "
  puts "-----+-----+-----"
  puts "     |     |     "
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}  "
  puts "     |     |     "
  puts "First to #{GAMES_TO_WIN} wins."
end

def initialize_board
  new_board = {}
  (1..9).each do |i|
    new_board[i] = BLANK_MARK
  end
  new_board
end

def joinor(array, delimiter = ', ', last = 'or')
  case array.size
  when 0 then ''
  when 1 then array[0].to_s
  when 2 then array.join(" #{last} ")
  else
    array[-1] = "#{last} #{array.last}"
    array.join(delimiter)
  end
end

def decide_first_player
  first_player = nil
  loop do
    prompt("Who do you want to go first? (1-Player 2-Computer 3-Random)")
    first_player = gets.chomp
    break if %w(1 2 3).include?(first_player)
    prompt("That's not a valid option, try again.")
  end

  if first_player == '1'
    prompt("Player goes first")
  elsif first_player == '2'
    prompt("Computer goes first")
  else
    first_player = %w(1 2).sample
    if first_player == '1'
      prompt("Player has been selected to go first")
    else prompt("Computer has been selected to go first")
    end
  end

  first_player
end

def valid_squares(brd)
  brd.keys.select { |square| brd[square] == BLANK_MARK }
end

def find_at_risk_square(line, board, mark = PLAYER_MARK)
  if board.values_at(*line).count(mark) == 2
    line.select { |square| board[square] == BLANK_MARK }.first
  end
end

def player_move!(board)
  input = nil
  loop do
    prompt("Please select an open square. Choose from #{joinor(valid_squares(board))}")
    input = gets.chomp.to_i
    break if valid_squares(board).include?(input)
    prompt("That is not a valid option.")
  end

  board[input] = PLAYER_MARK
end

def computer_move!(board)
  square = nil

  # offense
  WIN_COMBOS.each do |line|
    break if (square = find_at_risk_square(line, board, COMPUTER_MARK))
  end

  # defense
  if !square
    WIN_COMBOS.each do |line|
      break if (square = find_at_risk_square(line, board))
    end
  end

  # middle if available
  square = 5 if board[5] == BLANK_MARK && !square

  # pick a side square if middle is taken
  square = valid_squares(board).select { |sqr| [2, 4, 6, 8].include?(sqr) }.sample if !square

  # otherwise, random move
  square = valid_squares(board).sample if !square

  board[square] = COMPUTER_MARK
end

def place_piece!(board, current_player)
  if current_player == '1'
    player_move!(board)
  elsif current_player == '2'
    computer_move!(board)
  end
end

def winner(board)
  winner = nil

  if WIN_COMBOS.any? do |combo|
      combo.all? { |square| board[square] == COMPUTER_MARK }
    end
    winner = 'Computer'
  elsif WIN_COMBOS.any? do |combo|
      combo.all? { |square| board[square] == PLAYER_MARK }
    end
    winner = 'Player'
  end

  winner
end

def tie?(board)
  winner(board).nil? && board.values.all? { |square| square != BLANK_MARK }
end

player_score = 0
computer_score = 0

loop do
  board = initialize_board

  display_board(board)
  prompt("Welcome to Tic Tac Toe!")
  prompt("Score => Player: #{player_score} Computer: #{computer_score}")

  current_player = decide_first_player

  loop do
    place_piece!(board, current_player)

    display_board(board)

    prompt("Score => Player: #{player_score} Computer: #{computer_score}")

    current_player = %w(1 2).select { |player| player != current_player }.first

    break if winner(board) || tie?(board)
  end

  if tie?(board)
    prompt("It's a draw!")
  else
    player_score += 1 if winner(board) == 'Player'
    computer_score += 1 if winner(board) == 'Computer'
    display_board(board)
    prompt("Score => Player: #{player_score} Computer: #{computer_score}")
    prompt("#{winner(board)} has won!")
  end

  if player_score == GAMES_TO_WIN || computer_score == GAMES_TO_WIN
    winner = player_score > computer_score ? "You are" : "The computer is"
    prompt("#{winner} the winner!")
    player_score = 0
    computer_score = 0
  end

  prompt("Play again? (y or n)")
  break if gets.chomp.downcase.start_with?('n')
end

prompt("Thanks for playing!")
