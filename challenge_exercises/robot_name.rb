class Robot
  @@taken_names = []

  def initialize
  end

  def name
    return @name if @name

    new_name = nil
  
    loop do
      new_name = ""
      2.times { new_name << random_letter }
      3.times { new_name << random_digit}
      break if !@@taken_names.include?(new_name)
    end

    @@taken_names << new_name
    @name = new_name
  end

  def reset
    @@taken_names.delete(@name)
    @name = nil
  end

  def random_letter
    ("A".."Z").to_a.sample
  end

  def random_digit
    rand(1..9).to_s
  end
end