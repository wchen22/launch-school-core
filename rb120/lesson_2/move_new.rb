class Move
  attr_accessor :value, :defeats_list
  protected attr_accessor :relations

  include Comparable

  def initialize(value)
    @value = value
  end

  def <=>(other_move)
    if self.class == other_move.class
      0
    elsif defeats?(other_move)
      1
    else -1
    end
  end

  def defeats?(other_move)
    defeats_list.include?(other_move.class)
  end

  def relation_to(other_move)
    relations[other_move.class]
  end

  def to_s
    value
  end

end

class Rock < Move
  def initialize(value)
    super
    self.defeats_list = [Scissors, Lizard]
    self.relations = {
      Rock => "does nothing to",
      Paper => "is made obsolete as a drawing surface by",
      Scissors => "smashes",
      Lizard => "crushes",
      Spock => "is vaporized by",
    }
  end
end

class Paper < Move
  def initialize(value)
    super
    self.defeats_list = [Rock, Spock]
    self.relations = {
      Rock => "covers up",
      Paper => "does nothing to",
      Scissors => "is sliced apart by",
      Lizard => "is consumed",
      Spock => "disproves",
    }
  end
end

class Scissors < Move
  def initialize(value)
    super
    self.defeats_list = [Paper, Lizard]
    self.relations = {
      Rock => "is smashed to pieces by",
      Paper => "cuts up",
      Scissors => "does nothing to",
      Lizard => "decapitates",
      Spock => "is dismantled by",
    }
  end
end

class Lizard < Move
  def initialize(value)
    super
    self.defeats_list = [Paper, Spock]
    self.relations = {
      Rock => "is crushed by",
      Paper => "consumes",
      Scissors => "is decapitated by",
      Lizard => "does nothing to",
      Spock => "poisons",
    }
  end
end

class Spock < Move
  def initialize(value)
    super
    self.defeats_list = [Rock, Scissors]
    self.relations = {
      Rock => "vaporizes",
      Paper => "is disproven by",
      Scissors => "takes apart",
      Lizard => "is poisoned by",
      Spock => "does nothing to",
    }
  end
end

rock = Rock.new('r')
scissors = Scissors.new('s')

p rock.defeats? scissors
p rock.relation_to(scissors)
p rock <=> scissors

=begin
Move superclass contains a function for comparison that utilizes a data structure in each subclass
e.g. #relation_to(other_move)
    => "is vaporized by" 
    "crushes"

#<=> (other_move)
  1 if self.inferior_moves.include?(other_move)
  0 if same
  -1 otherwise

  do I need to super the inferior moves?


 # Game logic
human.move = Scissors.new
computer.move = Rock.new

=> "Human.name chose Scissors. Computer.name chose Rock"
=> "Scissors is crushed by Rock.""

if human.move > computer.move
  "You win!"
if same
  "Tie!"
else
  "Computer wins this round!"
=> "Computer wins!"
=end