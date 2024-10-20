class Parallax
  def self.shift(str1, str2)
    valid_strings = find_decreasing_substrings(str1)
    valid_strings.filter! { |substring| str2.include?(substring) }
    parallax(str1, valid_strings)
  end

  class << self
    private

    def parallax(string, array)
      output = string.dup
      array.each_with_index do |substring, index|
        if index.even?
          output.prepend(substring)
        elsif index.odd?
          output << substring
        end
      end
      output
    end

    def find_decreasing_substrings(string)
      output = []
      string.chars[0..-3].each_with_index do |_char, index|
        current_substring = string[index, 3]
        output << current_substring if decreasing?(current_substring)
      end
      output
    end

    def decreasing?(string)
      return false if string.chars.uniq.size < 3
      string_ascii_values = string.chars.map(&:ord)
      string_ascii_values.reverse == string_ascii_values.sort
    end
  end
end
