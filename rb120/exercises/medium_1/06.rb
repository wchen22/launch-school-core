# Create an object-oriented number guessing class for numbers in the range 1 to 100, with a limit of 7 guesses per game. The game should play like this:
 

# You have 7 guesses remaining.
# Enter a number between 1 and 100: 104
# Invalid guess. Enter a number between 1 and 100: 50
# Your guess is too low.

# You have 6 guesses remaining.
# Enter a number between 1 and 100: 75
# Your guess is too low.

# You have 5 guesses remaining.
# Enter a number between 1 and 100: 85
# Your guess is too high.

# You have 4 guesses remaining.
# Enter a number between 1 and 100: 0
# Invalid guess. Enter a number between 1 and 100: 80

# You have 3 guesses remaining.
# Enter a number between 1 and 100: 81
# That's the number!

# You won!

# game.play

# You have 7 guesses remaining.
# Enter a number between 1 and 100: 50
# Your guess is too high.

# You have 6 guesses remaining.
# Enter a number between 1 and 100: 25
# Your guess is too low.

# You have 5 guesses remaining.
# Enter a number between 1 and 100: 37
# Your guess is too high.

# You have 4 guesses remaining.
# Enter a number between 1 and 100: 31
# Your guess is too low.

# You have 3 guesses remaining.
# Enter a number between 1 and 100: 34
# Your guess is too high.

# You have 2 guesses remaining.
# Enter a number between 1 and 100: 32
# Your guess is too low.

# You have 1 guess remaining.
# Enter a number between 1 and 100: 32
# Your guess is too low.

# You have no more guesses. You lost!
# Note that a game object should start a new game with a new number to guess with each call to #play.

# We took a straightforward approach here and implemented a single class. Do you think it's a good idea to have a Player class? What methods and data should be part of it? How many Player objects do you need? Should you use inheritance, a mix-in module, or a collaborative object?

=begin
It doesn't seem to make the most sense to have a Player class here, since there is a single player who can just make a guess.

If we did want to, some considerations:
A Player can make a guess.
Instance variables might be current_guess, remaining_guesses
Useful methods: out_of_guesses?, reset

Inheritance doesn't make sense here as Player doesn't fall into a 'type-of' relationship with any other game objects. There doesn't seem to be a great logical reason to use a mix-in; States and behaviors of a Player don't really extend the functionality of the game in a logical way. A collaborator object makes the most sense - A Player can be initialized and assigned to the game. The game engine can handle calculations of winning/losing, displaying message; while the Player can just have responsibility for managing its guesses. We could use idiomatic syntax like guess = Player.guess; until Player.no_more_guesses?, etc. 
=end