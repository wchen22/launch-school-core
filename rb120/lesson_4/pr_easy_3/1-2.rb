# If we have this code:

class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

# # What happens in each of the following cases:

# hello = Hello.new
# hello.hi
# # => "Hello"

# hello = Hello.new
# hello.bye
# # => NoMethodError

# hello = Hello.new
# hello.greet
# # => ArgumentError

# hello = Hello.new
# hello.greet("Goodbye")
# # => "Goodbye"

# Hello.hi
# # => NoMethodError

#Q2 If we call Hello.hi we get an error message. How would you fix this?

class Hello < Greeting
  def self.hi
    puts("Hello from the class level")
  end
  def hi
    greet("Hello")
  end
end

Hello.hi