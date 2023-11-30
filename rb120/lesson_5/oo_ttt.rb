require 'pry'
class Board
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                  [[1, 5, 9], [3, 5, 7]]              # diagonals

  def initialize
    @squares = {}
    reset
  end

  def []=(num, marker)
    @squares[num].marker = marker
  end

  # rubocop:disable Metrics/AbcSize
  # rubocop:disable Metrics/MethodLength
  def draw
    puts "     |     |     "
    puts "  #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}  "
    puts "     |     |     "
    puts "-----+-----+-----"
    puts "     |     |     "
    puts "  #{@squares[4]}  |  #{@squares[5]}  |  #{@squares[6]}  "
    puts "     |     |     "
    puts "-----+-----+-----"
    puts "     |     |     "
    puts "  #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]}  "
    puts "     |     |     "
  end
  # rubocop:enable Metrics/AbcSize
  # rubocop:enable Metrics/MethodLength

  def unmarked_keys
    @squares.keys.select { |key| @squares[key].unmarked? }
  end

  def unmarked_keys_string
    if unmarked_keys.size == 1
      unmarked_keys.first.to_s
    else
      "#{unmarked_keys[0...-1].join(', ')}, or #{unmarked_keys[-1]}"
    end
  end

  def full?
    unmarked_keys.empty?
  end

  def find_winning_key(marker)
    WINNING_LINES.each do |line|
      marked_line = line.map { |key| @squares[key].marker }
      line.each do |key|
        if @squares[key].unmarked? && marked_line.count(marker) == 2
          return key
        end
      end
    end

    nil
  end

  def winning_marker
    WINNING_LINES.each do |line|
      return @squares[line[0]].marker if winning_line?(line)
    end
    nil
  end

  def someone_won?
    !!winning_marker
  end

  def reset
    (1..9).each do |key|
      @squares[key] = Square.new
    end
  end

  private

  def winning_line?(line)
    first_square = @squares[line[0]]
    !first_square.unmarked? &&
      line.all? { |key| @squares[key].marker == first_square.marker }
  end
end

class Square
  INITIAL_MARKER = " "
  attr_accessor :marker

  def initialize(marker=INITIAL_MARKER)
    @marker = marker
  end

  def to_s
    @marker
  end

  def unmarked?
    marker == INITIAL_MARKER
  end
end

class Player
  attr_accessor :score
  attr_reader :marker, :name

  def initialize(marker, name)
    @marker = marker
    @name = name
    @score = 0
  end

  def opposing_marker
    (%w(X O) - [marker]).first
  end
end

class Human < Player
  def initialize
    super(select_marker, select_name)
  end

  private

  def select_marker
    answer = nil
    loop do
      puts "Please choose a marker, X or O"
      answer = gets.chomp.upcase
      break if %w(X O).include? answer
      puts "Sorry, invalid choice."
    end
    answer
  end

  def select_name
    answer = nil
    loop do
      puts "Please enter your name."
      answer = gets.chomp
      break if !answer.empty?
    end
    answer
  end
end

class Computer < Player
  @@names = ['Victor', 'Jackie', 'Tobin']
  def initialize(marker)
    super(marker, @@names.sample)
  end
end

class TTTGame
  WINNING_SCORE = 2

  attr_reader :board, :human, :computer

  def initialize
    display_welcome_message
    @board = Board.new
    @human = Human.new
    @computer = Computer.new(human.opposing_marker)
    randomize_first_player
  end

  def play
    clear
    main_game
    display_goodbye_message
  end

  private

  def display_welcome_message
    puts "Welcome to Tic Tac Toe!"
    puts ""
  end

  def display_goodbye_message
    puts "Thanks for playing Tic Tac Toe! Goodbye!"
  end

  def randomize_first_player
    @current_marker = [human.marker, computer.marker].sample
  end

  def go_to_next_round?
    answer = nil
    loop do
      puts "Enter 'r' to go to next round"
      answer = gets.chomp.downcase
      break if answer == 'r'
      puts "Sorry, please enter 'r' to advance to the next round!"
    end
    answer == 'r'
  end

  def player_move
    loop do
      current_player_moves
      if board.someone_won?
        update_score
        break
      elsif board.full?
        break
      end
      clear_screen_and_display_board if human_turn?
    end
  end

  def display_grand_winner
    case board.winning_marker
    when human.marker
      puts "#{human.name} won #{WINNING_SCORE} rounds. #{computer.name} loses!"
    when computer.marker
      puts "#{computer.name} won #{WINNING_SCORE} rounds. #{human.name} loses!"
    end
  end

  def main_game
    loop do
      loop do
        display_board
        player_move
        display_result
        if winning_score_reached?
          display_grand_winner
          break
        else
          reset_board if go_to_next_round?
          next
        end
      end
      break unless play_again?
      reset_game
    end
  end

  def display_board
    puts "#{human.name} is a #{human.marker}. #{computer.name} is a #{computer.marker}"
    puts ""
    board.draw
    puts "Current score || #{human.name}: #{human.score} #{computer.name}: #{computer.score} || First to #{WINNING_SCORE} wins"
    puts ""
  end

  def clear
    system 'clear'
  end

  def clear_screen_and_display_board
    clear
    display_board
  end

  def human_turn?
    @current_marker == human.marker
  end

  def current_player_moves
    if human_turn?
      human_moves
      @current_marker = computer.marker
    else
      computer_moves
      @current_marker = human.marker
    end
  end

  def human_moves
    puts "Choose a square (#{board.unmarked_keys_string})"
    square = nil
    loop do
      square = gets.chomp.to_i
      break if (board.unmarked_keys).include?(square)
      puts "Sorry, that's not a valid choice."
    end

    board[square] = human.marker
  end

  def computer_moves
    winning_computer_key = board.find_winning_key(computer.marker)
    winning_human_key = board.find_winning_key(human.marker)

    if winning_computer_key
      board[winning_computer_key] = computer.marker
    elsif winning_human_key
      board[winning_human_key] = computer.marker
    elsif board.unmarked_keys.include?(5)
      board[5] = computer.marker
    else
      board[board.unmarked_keys.sample] = computer.marker
    end
  end

  def update_score
    case board.winning_marker
    when human.marker
      human.score += 1
    when computer.marker
      computer.score += 1
    end
  end

  def display_result
    clear_screen_and_display_board

    case board.winning_marker
    when human.marker
      puts "#{human.name} wins this round!"
    when computer.marker
      puts "#{computer.name} wins this round!"
    else
      puts "It's a tie!"
    end
  end

  def winning_score_reached?
    human.score == WINNING_SCORE ||
      computer.score == WINNING_SCORE
  end

  def play_again?
    response = nil
    loop do
      puts "Would you like to play again? (Y/N)"
      response = gets.chomp.downcase
      break if %w(y n).include? response
      puts "Sorry, must be y or n"
    end

    response == 'y'
  end

  def reset_board
    board.reset
    randomize_first_player
    clear
  end

  def reset_game
    reset_board
    human.score = 0
    computer.score = 0
    display_play_again_message
  end

  def display_play_again_message
    puts "Let's play again!"
    puts ""
  end
end

game = TTTGame.new
game.play
