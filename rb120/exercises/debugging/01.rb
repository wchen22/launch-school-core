class Library 
  attr_accessor :address, :phone, :books

  def initialize(address, phone)
    @address = address
    @phone = phone
    @books = []
  end

  def check_in(book)
    books.push(book)
  end
end

# Lines 1-13 define a Library class. The attr_accessor shortcut method is used to create setter and getter methods for 3 instance variables which can be unique attributes of each Library instance : @address, @phone, and @books 

# The constructor has two parameters, an address and a phone. When a Library object is instantiated, the arguments are passed to the constructor and assigned to the instance variables. @books is assigned to a new empty array.

# Finally, there is an instance method check_in which takes a book as an argument and appends it to the @books array.

class Book
  attr_accessor :title, :author, :isbn

  def initialize(title, author, isbn)
    @title = title
    @author = author
    @isbn = isbn
  end

  def display_data
    puts "---------------"
    puts "Title: #{title}"
    puts "Author: #{author}"
    puts "ISBN: #{isbn}"
    puts "---------------"
  end
end

# A different class Book is defined. The available instance variables for each boook are the title, author, and isbn number. Getter and setters are available for all of these instance variables bc of attr_accessor. 

# The constructor is pretty straightforward and sets all the object attributes to the arguments provided during instantiation.

# A method display_data is defined which outputs the attributes in a text format. 

community_library = Library.new('123 Main St.', '555-232-5652') 
learn_to_program = Book.new('Learn to Program', 'Chris Pine', '978-1934356364')
little_women = Book.new('Little Women', 'Louisa May Alcott', '978-1420951080')
wrinkle_in_time = Book.new('A Wrinkle in Time', 'Madeleine L\'Engle', '978-0312367541')

community_library.check_in(learn_to_program)
community_library.check_in(little_women)
community_library.check_in(wrinkle_in_time)

community_library.books.each { |book| book.display_data }
# community_library.books.display_data 
# community_library.books calls the getter for the @books array, however there is no display_data method available. display_data is available to book objects, so we can fix this by iterating through the array and calling display_data for each one.


=begin

On line 42 of our code, we intend to display information regarding the books currently checked in to our community library. Instead, an exception is raised. Determine what caused this error and fix the code so that the data is displayed as expected. 

=end