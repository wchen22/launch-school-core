=begin
Behold this incomplete class for constructing boxed banners.

Complete this class so that the test cases shown below work as intended. You are free to add any methods or instance variables you need. However, do not make the implementation details public.

You may assume that the input will always fit in your terminal window.

=end

class Banner
  def initialize(message)
    @message = message
    @inner_size = message.size + 2
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private

  def horizontal_rule
    "+#{"-" * @inner_size}+"
  end

  def empty_line
    "|#{" " * @inner_size}|"
  end

  def message_line
    "| #{@message} |"
  end
end

banner = Banner.new('To boldly go where no one has gone before.')
puts banner

=begin
+--------------------------------------------+
|                                            |
| To boldly go where no one has gone before. |
|                                            |
+--------------------------------------------+
=end

banner = Banner.new('')
puts banner

=begin
+--+
|  |
|  |
|  |
+--+
=end

# Further Exploration
# Modify this class so new will optionally let you specify a fixed banner width at the time the Banner object is created. The message in the banner should be centered within the banner of that width. Decide for yourself how you want to handle widths that are either too narrow or too wide.

class Banner
  def initialize(message, width = message.size + 4)
    if width < message.size + 4
      width = message.size + 4
      puts "Invalid width size, default banner width of #{width} used."
    end
    
    @message = message
    @inner_size = width - 4
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private

  def horizontal_rule
    "+-#{"-" * @inner_size}-+"
  end

  def empty_line
    "| #{" " * @inner_size} |"
  end

  def message_line
    "| #{@message.center(@inner_size)} |"
  end
end

banner = Banner.new('To boldly go where no one has gone before.', 2)
puts banner