class Diamond
  def self.make_diamond(letter)
    line_size = (letter.upcase.ord-64) * 2 -1
    output_array = ("A"..letter).to_a + ("A"...letter).to_a.reverse

    output_array.map do |let|
      current_value = let.ord-64
      if let == "A"
        "A".center(line_size) + "\n"
      else
        number_of_spaces = 2 * (current_value-1) - 1
        "#{let}#{" "*number_of_spaces}#{let}".center(line_size) + "\n"
      end
    end.join
  end
end
