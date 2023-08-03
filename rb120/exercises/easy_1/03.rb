# Complete this program so that it produces the expected output:

# class Book
#   def initialize(author, title)
#     @author = author
#     @title = title
#   end

#   def to_s
#     %("#{title}", by #{author})
#   end
# end


class Book
  attr_reader :author, :title
  def initialize(author, title)
    @author = author
    @title = title
  end

  def to_s
    %("#{title}", by #{author})
  end
end

book = Book.new("Neil Stephenson", "Snow Crash")
puts %(The author of "#{book.title}" is #{book.author}.)
puts %(book = #{book}.)

#Expected output:

# The author of "Snow Crash" is Neil Stephenson.
# book = "Snow Crash", by Neil Stephenson.

# Further Exploration
# What are the differences between attr_reader, attr_writer, and attr_accessor? Why did we use attr_reader instead of one of the other two? Would it be okay to use one of the others? Why or why not?

# Instead of attr_reader, suppose you had added the following methods to this class:

# def title
#   @title
# end

# def author
#   @author
# end
# Would this change the behavior of the class in any way? If so, how? If not, why not? Can you think of any advantages of this code?

=begin

attr_reader, attr_writer, and attr_accessor are built in Ruby syntax which create either getters, setters, or both for the arguments passed to them. We used attr_reader in this problem because the scope of the program only required that we were able to access the title and author instance variables, not to modify them. We could have used attr_accessor and that would've worked fine, but we would have exposed the setter methods, which would be bad coding practice if that's not the intended behavior.

Defining the getters explicitly would not have changed the behavior of the class, because that is exactly what attr_reader does. There is an advantage to explicitly defining getters IF we want to implement more functionality, such as capitalizing the instance variables so that we always have a consistently formatted title or author.

=end