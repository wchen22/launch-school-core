# Q8 If we have these two classes, What can we add to the Bingo class to allow it to inherit the play method from the Game class?

class Game
  def play
    "Start the game!"
  end
end

# add < Game
class Bingo < Game
  def rules_of_play
    #rules of play
  end

  # Q9: What would happen if we added a play method to the Bingo class, keeping in mind that there is already a method of this name in the Game class that the Bingo class inherits from.

# It would overwrite the Game#play method. To be more specific, Ruby will look first in the calling object's class definition for the method called before going up the chain.

  def play
    p "Let's play Bingo! Your center square is free."
  end
end

Bingo.new.play

