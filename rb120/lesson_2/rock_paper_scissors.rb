class Player
  attr_accessor :move, :name

  def initialize
    set_name
  end

  def to_s
    name
  end
end

class Human < Player
  def set_name
    loop do
      puts "Please enter your name."
      self.name = gets.chomp
      break unless name.nil?
      puts "Sorry, must enter a value."
    end
  end

  def choose
    loop do
      puts "Please choose rock, paper, or scissors:"
      self.move = Move.new(gets.chomp)
      break if ['rock', 'paper', 'scissors'].include? move.to_s
      puts "Sorry, invalid choice."
    end
  end
end

class Computer < Player
  def set_name
    self.name = ['R2D2', 'Hal', 'Wall-E'].sample
  end

  def choose
    self.move = Move.new(['rock', 'paper', 'scissors'].sample)
  end
end

class Move
  attr_reader :value
  
  include Comparable
  ORDER_OF_WINS = ['rock', 'paper', 'scissors']

  def initialize(value)
    @value = value
  end

  def <=>(other_move)
    comparison = (ORDER_OF_WINS.index(value) + 1) % 3

    if comparison == ORDER_OF_WINS.index(other_move.value)
      -1
    elsif value == other_move.value
      0
    else
      1
    end
  end

  def to_s
    value
  end
end

class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors!"
  end

  def display_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors. Good bye!"
  end

  def display_winner
    puts "#{human} chose #{human.move}."
    puts "#{computer} chose #{computer.move}."

    if computer.move > human.move
      puts "#{computer.name} wins!"
    elsif computer.move < human.move
      puts "#{human.name} wins!"
    else
      puts "It's a tie!"
    end
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp
      break if ['y', 'n'].include? answer.downcase
      puts "Sorry, must be y or n"
    end

    answer == 'y'
  end

  def play
    display_welcome_message
    loop do
      human.choose
      computer.choose
      display_winner
      break unless play_again?
    end
    display_goodbye_message
  end
end

RPSGame.new.play