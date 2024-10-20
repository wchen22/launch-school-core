# film_library.rb
class FilmLibrary
  attr_reader :title
  attr_accessor :rating

  def initialize(title, rating = 0)
    @title = title
    @rating = rating
  end
end