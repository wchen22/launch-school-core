require 'minitest/autorun'
require_relative 'film_library'

class FilmLibraryTest < Minitest::Test
  def test_default_rating_is_zero
    assert_equal 0, FilmLibrary.new("Barbie").rating
  end

  def test_no_title_error
    assert_raises ArgumentError do
      FilmLibrary.new
    end
  end
end