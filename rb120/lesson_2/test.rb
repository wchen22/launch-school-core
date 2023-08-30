def choose_computer
  choice = nil
  loop do
    puts "Who would you like to play against? (1)-Hal (2)-R2D2 (3)-Samantha (4)-Default"
    choice = gets.chomp
    break if %w(1 2 3 4).include?(choice)
    puts "Sorry invalid choice. Please enter a number from 1 to 4."
  end

  choice = case choice
            when 1 then Hal.new
            when 2 then R2D2.new
            when 3 then Samantha.new
            when 4 then Default.new
          end

  choice
end

class R2D2
end
p choose_computer