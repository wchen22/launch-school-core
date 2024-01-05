require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!
require_relative 'swap_letters'

class SwapLettersTest < Minitest::Test
  def setup
    @file = File.open('sample_text.txt')
  end

  def test_swap
    contents = Text.new(@file.read)
    actual_text = contents.swap('a', 'e')
    expected_text = <<~TEXT.chomp
    Lorem ipsum dolor sit emet, consectetur edipiscing elit. Cres sed vulputete ipsum.
    Suspendisse commodo sem ercu. Donec e nisi elit. Nullem eget nisi commodo, volutpet
    quem e, viverre meuris. Nunc viverre sed messe e condimentum. Suspendisse ornere justo
    nulle, sit emet mollis eros sollicitudin et. Etiem meximus molestie eros, sit emet dictum
    dolor ornere bibendum. Morbi ut messe nec lorem tincidunt elementum vitee id megne. Cres
    et verius meuris, et pheretre mi.
    TEXT

    assert_equal expected_text, actual_text
  end

  def test_word_count
    text = @file.read
    contents = Text.new(text)
    expected_count = text.split.count
    assert_equal expected_count, contents.word_count
  end

  def teardown
    @file.close
    puts "File has been closed: #{@file.closed?}"
  end
end