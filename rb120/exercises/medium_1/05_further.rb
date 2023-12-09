# You can write minilang programs that take input values by simply interpolating values into the program string with Kernel#format. For instance,

# CENTIGRADE_TO_FAHRENHEIT =
#   '5 PUSH %<degrees_c>d PUSH 9 MULT DIV PUSH 32 ADD PRINT'
# Minilang.new(format(CENTIGRADE_TO_FAHRENHEIT, degrees_c: 100)).eval
# # 212
# Minilang.new(format(CENTIGRADE_TO_FAHRENHEIT, degrees_c: 0)).eval
# # 32
# Minilang.new(format(CENTIGRADE_TO_FAHRENHEIT, degrees_c: -40)).eval
# # -40
# This process could be simplified by passing some optional parameters to eval, and using those parameters to modify the program string.

# CENTIGRADE_TO_FAHRENHEIT =
#   '5 PUSH %<degrees_c>d PUSH 9 MULT DIV PUSH 32 ADD PRINT'
# minilang = Minilang.new(CENTIGRADE_TO_FAHRENHEIT)
# minilang.eval(degrees_c: 100)
# # 212
# minilang.eval(degrees_c: 0)
# # 32
# minilang.eval(degrees_c: -40)
# # -40
# Try to implement this modification. Also, try writing other minilang programs, such as one that converts fahrenheit to centigrade, another that converts miles per hour to kilometers per hour (3 mph is approximately equal to 5 kph). Try writing a program that needs two inputs: for example, compute the area of a rectangle.

# Changes to implement from V1
# Make different errors inherit from a standard minilangerror
# - This should make flow control for errors more intuitive
# Benefit of evaluating tokens one by one
# - Better encapsulation of error handling
# Using a set makes sense because tokens are unique, also faster lookup time


require 'pry-byebug'

class MinilangError < StandardError
end

class EmptyStackError < MinilangError
end

class InvalidTokenError < MinilangError
end

CENTIGRADE_TO_FAHRENHEIT =
  '5 PUSH %<degrees_c>d PUSH 9 MULT DIV PUSH 32 ADD PRINT'

FAHRENHEIT_TO_CENTIGRADE =
  '9 PUSH 32 PUSH %<degrees_f>d SUB PUSH 5 MULT DIV PRINT'

AREA_OF_RECTANGLE = 
  '%<length_1>d PUSH %<length_2>d MULT PRINT'
  
class Minilang
  VALID_COMMANDS = %w(PUSH POP ADD SUB MULT DIV MOD PRINT)
  attr_accessor :register
  attr_reader :program, :stack

  def initialize(program)
    @program = program
    @stack = []
    @register = 0
  rescue MinilangError => error
    puts error.message
  end

  # def program=(commands)
  #   @program = commands.split.map do |command|
  #     if command.to_i.to_s == command
  #       command.to_i
  #     elsif VALID_COMMANDS.include?(command)
  #       command.downcase.to_sym
  #     else
  #       raise InvalidTokenError.new("Invalid token: #{command}")
  #     end
  #   end
  # end

  def eval(format_parameter=nil)
    @program = format(@program, format_parameter) if format_parameter
    @program.split.each { |token|     
      eval_token(token) 
    }

    rescue MinilangError => error
      puts error.message
  end

  def eval_token(token)
    #binding.pry
    if token =~ /\A[-+]?\d+\z/
      @register = token.to_i
    elsif VALID_COMMANDS.include?(token)
      send(token.downcase)
    else
      raise InvalidTokenError, "Invalid token: #{token}"
    end


  end

  def set_register(number)
    self.register = number
  end

  def push
    stack << register
  end

  def pop
    raise EmptyStackError.new("Empty stack!") if stack.empty?
    self.register = stack.pop
  end

  def add
    self.register += pop
  end

  def sub
    self.register -= pop
  end

  def mult
    self.register *= pop
  end

  def div
    self.register /= pop
  end

  def mod
    self.register %= pop
  end

  def print
    puts register
  end

end

# minilang = Minilang.new(CENTIGRADE_TO_FAHRENHEIT)
# minilang.eval(degrees_c: -40)

minilang2 = Minilang.new(FAHRENHEIT_TO_CENTIGRADE)
minilang2.eval(degrees_f: -40)

minilang3 = Minilang.new(AREA_OF_RECTANGLE)
minilang3.eval(length_1: 20, length_2: 30)

# Minilang.new('PRINT').eval
# # 0

# Minilang.new('5 PUSH 3 MULT PRINT').eval
# # 15

# Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval
# # 5
# # 3
# # 8

# Minilang.new('5 PUSH 10 PRINT POP PRINT').eval
# # 10
# # 5

# Minilang.new('5 PUSH POP POP PRINT').eval
# # Empty stack!

# Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
# # 6

# Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
# # 12

# Minilang.new('-3 PUSH 5 XSUB PRINT').eval
# # Invalid token: XSUB

# Minilang.new('-3 PUSH 5 SUB PRINT').eval
# # 8

# Minilang.new('6 PUSH').eval
# # (nothing printed; no PRINT commands)