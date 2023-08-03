# Complete this program so that it produces the expected output:

# class Book
#   def to_s
#     %("#{title}", by #{author})
#   end
# end

class Book
  attr_accessor :title, :author

  def to_s
    %("#{title}", by #{author})
  end
end

book = Book.new
book.author = "Neil Stephenson"
book.title = "Snow Crash"
puts %(The author of "#{book.title}" is #{book.author}.)
puts %(book = #{book}.)

# The author of "Snow Crash" is Neil Stephenson.
# book = "Snow Crash", by Neil Stephenson.

# Further Exploration
# What do you think of this way of creating and initializing Book objects? (The two steps are separate.) Would it be better to create and initialize at the same time like in the previous exercise? What potential problems, if any, are introduced by separating the steps?

# Separating the steps allows for inconsistency of the states of the Book objects, whereby some objects would have an author or title, while others could have one or the other or neither.  By creating and initializing at the same time, and assigning instance variables in the constructor, we can make sure each Book has an author or title, or execute some behavior if the arguments are 'invalid'.

# Separating the steps also requires an exposed setter for instance variables that might otherwise be unnecessary.

# Additionally you can interact with instance variables before they have been set which can lead to unexpected errors.