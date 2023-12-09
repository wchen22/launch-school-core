require 'pry-byebug'

class EmptyStackError < StandardError
end

class InvalidTokenError < StandardError
end

class Minilang
  VALID_COMMANDS = %w(PUSH POP ADD SUB MULT DIV MOD PRINT)
  attr_accessor :register, :program
  attr_reader :commands, :stack

  def initialize(commands)
    self.register = 0

    begin
      self.program = commands
    rescue InvalidTokenError => e
      puts e
    end

    #binding.pry

    @stack = []
  end

  def program=(commands)
    @program = commands.split.map do |command|
      if command.to_i.to_s == command
        command.to_i
      elsif VALID_COMMANDS.include?(command)
        command.downcase.to_sym
      else
        raise InvalidTokenError.new("Invalid token: #{command}")
      end
    end
  end

  def set_register(number)
    self.register = number
  end

  def push
    stack << register
  end

  def pop
    begin
      raise EmptyStackError.new("Empty stack!") if stack.empty?
      self.register = stack.pop
    rescue EmptyStackError => e
      puts e
    end
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
    true
  end

  def eval
    return if program.nil?

    program.each do |command|
      if command.is_a?(Integer)
        send(:set_register, command.to_i) 
      else
        result = send(command)
        break if result.nil?
      end
    end
  end

end

Minilang.new('PRINT').eval
# 0

Minilang.new('5 PUSH 3 MULT PRINT').eval
# 15

Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval
# 5
# 3
# 8

Minilang.new('5 PUSH 10 PRINT POP PRINT').eval
# 10
# 5

Minilang.new('5 PUSH POP POP PRINT').eval
# Empty stack!

Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
# 6

Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
# 12

Minilang.new('-3 PUSH 5 XSUB PRINT').eval
# Invalid token: XSUB

Minilang.new('-3 PUSH 5 SUB PRINT').eval
# 8

Minilang.new('6 PUSH').eval
# (nothing printed; no PRINT commands)