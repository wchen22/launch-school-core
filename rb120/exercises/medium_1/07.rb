# Update your solution to accept a low and high value when you create a GuessingGame object, and use those values to compute a secret number for the game. You should also change the number of guesses allowed so the user can always win if she uses a good strategy. You can compute the number of guesses with:

=begin
-Use hash constants to store text that doesn't use interpolation
-Fix 1 guesses remaining text
-Move instance variables to a constructor
-Have GuessingGame.new take a start and end argument for the range
=end

class GuessingGame
  GUESS_ARRAY = (1..100).to_a
  attr_reader :guess_array
  attr_accessor :secret_number, :number_of_guesses

  def initialize(low, high)
    @guess_array = (low..high).to_a
    @secret_number = nil
    @number_of_guesses = compute_number_of_guesses
    @guess = nil
  end

  def reset
    self.secret_number = guess_array.sample
  end

  def compute_number_of_guesses
    Math.log2(guess_array.size).to_i + 1
  end

  def play
    reset

    number_of_guesses.downto(1) do
      @guess = request_guess
      print_result
      break if correct?
      @number_of_guesses -=1
    end

    print_final_result
  end

  def correct?
    @guess == secret_number   
  end

  def print_result
    system 'clear'

    if correct?
      puts "That's the number!"
    elsif @guess < secret_number
      puts "#{@guess} is too low."
    else
      puts "#{@guess} is too high."
    end
  end

  def print_final_result
    if correct?
      puts "You won!"
    else
      puts "You have no more guesses. You lost!"
    end
  end

  def request_guess
    puts "You have #{number_of_guesses} guesses remaining."
    answer = nil

    loop do
      puts "Enter a number between #{guess_array.first} and #{guess_array.last}:"
      answer = gets.chomp.to_i
      break if guess_array.include?(answer)
      print "Invalid guess. "
    end

    answer
  end


end

game = GuessingGame.new(100, 300)
game.play