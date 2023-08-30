class Player
  attr_accessor :move, :name, :score, :move_history

  def initialize
    set_name
    self.score = 0
    @move_history = SessionHistory.new(name)
  end

  def create_move(choice)
    case choice
    when "1" then Rock.new
    when "2" then Paper.new
    when "3" then Scissors.new
    when "4" then Lizard.new
    when "5" then Spock.new
    end
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
      puts "Please choose 1-Rock 2-Paper, 3-Scissors, 4-Lizard, or 5-Spock"
      choice = gets.chomp
      self.move = create_move(choice)

      if %w(1 2 3 4 5).include?(choice)
        move_history.add(move)
        break
      end

      puts "Sorry, invalid choice."
    end
  end
end

class Computer < Player
  attr_reader :move_weights

  def initialize(weights_array)
    super()
    self.move_weights = (weights_array)
  end

  def move_weights=(weights_array)
    choices = ['1', '2', '3', '4', '5']
    @move_weights = choices.zip(weights_array).to_h
  end

  def set_name
    self.name = self.class.to_s
  end

  def choose
    weighted_moves = []

    move_weights.each do |move, weight|
      weighted_moves += [move] * weight
    end

    choice = weighted_moves.sample
    self.move = create_move(choice)
    move_history.add(move)
  end
end

class R2D2 < Computer
  MOVE_WEIGHTS = [85, 5, 5, 0, 5]

  def initialize
    super(MOVE_WEIGHTS)
  end
end

class Hal < Computer
  MOVE_WEIGHTS = [10, 0, 80, 10, 0]

  def initialize
    super(MOVE_WEIGHTS)
  end
end

class Samantha < Computer
  MOVE_WEIGHTS = [0, 70, 0, 0, 30]

  def initialize
    super(MOVE_WEIGHTS)
  end
end

class Default < Computer
  MOVE_WEIGHTS = [20, 20, 20, 20, 20]

  def initialize
    super(MOVE_WEIGHTS)
  end
end

class Move
  attr_accessor :value, :defeats_list

  include Comparable

  def <=>(other_move)
    # Originally had `self.instance_of?` which generated a cop
    # Is this an example of an implicit self?
    if instance_of?(other_move.class)
      0
    elsif defeats?(other_move)
      1
    else
      -1
    end
  end

  def relation_summary(other_move)
    "#{self} #{relation_to[other_move.class]} #{other_move}"
  end

  def to_s
    self.class.name
  end

  protected

  attr_accessor :relation_to

  def defeats?(other_move)
    defeats_list.include?(other_move.class)
  end
end

class Rock < Move
  def initialize
    super
    self.defeats_list = [Scissors, Lizard]
    self.relation_to = {
      Rock => "does nothing to",
      Paper => "is made obsolete as a drawing surface by",
      Scissors => "smashes",
      Lizard => "crushes",
      Spock => "is vaporized by"
    }
  end
end

class Paper < Move
  def initialize
    super
    self.defeats_list = [Rock, Spock]
    self.relation_to = {
      Rock => "covers up",
      Paper => "does nothing to",
      Scissors => "is sliced apart by",
      Lizard => "is consumed by",
      Spock => "disproves"
    }
  end
end

class Scissors < Move
  def initialize
    super
    self.defeats_list = [Paper, Lizard]
    self.relation_to = {
      Rock => "is smashed to pieces by",
      Paper => "cuts up",
      Scissors => "does nothing to",
      Lizard => "decapitates",
      Spock => "is dismantled by"
    }
  end
end

class Lizard < Move
  def initialize
    super
    self.defeats_list = [Paper, Spock]
    self.relation_to = {
      Rock => "is crushed by",
      Paper => "consumes",
      Scissors => "is decapitated by",
      Lizard => "does nothing to",
      Spock => "poisons"
    }
  end
end

class Spock < Move
  def initialize
    super
    self.defeats_list = [Rock, Scissors]
    self.relation_to = {
      Rock => "vaporizes",
      Paper => "is disproven by",
      Scissors => "takes apart",
      Lizard => "is poisoned by",
      Spock => "does nothing to"
    }
  end
end

class SessionHistory
  attr_accessor :move_history
  attr_reader :name

  def initialize(name)
    @name = name
    @move_history = {
      Rock => { times_played: 0, percentage: 0 },
      Paper => { times_played: 0, percentage: 0 },
      Scissors => { times_played: 0, percentage: 0 },
      Lizard => { times_played: 0, percentage: 0 },
      Spock => { times_played: 0, percentage: 0 }
    }
  end

  def add(move)
    @move_history[move.class][:times_played] += 1
    update_percentages
  end

  def update_percentages
    total_moves = move_history.sum { |_move, stats| stats[:times_played] }

    move_history.each do |_move, stats|
      percentage = 100 * (stats[:times_played].to_f / total_moves)
      stats[:percentage] = "#{format('%.1f', percentage)}%"
    end
  end

  def display
    row1 = "| Move:         |"
    row2 = "| Times Played: |"
    row3 = "| Percentage:   |"

    move_history.each do |move, stats|
      row1 += "#{move.to_s.center(10)}|"
      row2 += "#{stats[:times_played].to_s.center(10)}|"
      row3 += "#{stats[:percentage].to_s.center(10)}|"
    end

    ["#{name}'s History", row1, row2, row3]
  end
end

class RPSGame
  attr_accessor :human, :computer

  TARGET_SCORE = 10

  def initialize
    display_welcome_message
    @human = Human.new
    @computer = initialize_computer
  end

  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors, Lizard, Spock!"
  end

  def display_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors. Good bye!"
  end

  def choose_computer
    choice = nil
    loop do
      puts "Choose your opponent: (1)-Hal (2)-R2D2 (3)-Samantha (4)-Default"
      choice = gets.chomp.to_i
      break if [1, 2, 3, 4].include?(choice)
      puts "Sorry invalid choice. Please enter a number from 1 to 4."
    end
    choice
  end

  def initialize_computer
    choice = choose_computer
    case choice
    when 1 then Hal.new
    when 2 then R2D2.new
    when 3 then Samantha.new
    when 4 then Default.new
    end
  end

  def find_winner
    case computer.move <=> human.move
    when 1 then computer
    when 0 then nil
    when -1 then human
    end
  end

  def update_score(winner)
    winner.score += 1 if !winner.nil?
  end

  def announce_winner(winner)
    if winner.nil?
      puts "It's a tie!\n"
    else
      puts "#{winner.name} wins this round!\n"
    end
  end

  def display_score
    print "Score: #{human.name}: #{human.score}, "
    print "#{computer.name}: #{computer.score}. "
    print "First to #{TARGET_SCORE} wins\n\n"
  end

  def summarize_moves
    puts "#{human} chose #{human.move}"
    puts "#{computer} chose #{computer.move}\n\n"
    puts human.move.relation_summary(computer.move)
  end

  def summarize_round(winner)
    summarize_moves
    announce_winner(winner)
    display_score
    display_stats(human, computer)
    puts
  end

  def play_again?
    answer = nil
    loop do
      puts "\nWould you like to play again? (y/n)"
      answer = gets.chomp.downcase
      break if ['y', 'n'].include? answer
      puts "Sorry, must be y or n"
    end

    answer == 'y'
  end

  def reset_scores
    human.score = 0
    computer.score = 0
  end

  def score_reached?
    human.score == TARGET_SCORE ||
      computer.score == TARGET_SCORE
  end

  def display_final_winner
    final_winner = [human, computer].max_by(&:score)
    puts "\n#{final_winner} wins it all!"
  end

  def display_stats(*players)
    players.each do |player|
      history = player.move_history
      puts history.display
    end
  end

  def play_round
    human.choose
    computer.choose
    system('clear')
    winner = find_winner
    update_score(winner)
    summarize_round(winner)
  end

  def play
    loop do
      reset_scores

      until score_reached?
        play_round
      end

      display_final_winner

      break unless play_again?
    end

    display_goodbye_message
  end
end

RPSGame.new.play
