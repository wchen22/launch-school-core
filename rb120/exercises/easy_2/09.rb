module Walkable
  def walk
    full_name = if @title
                  title + " " + name
                else
                  name
                end
                
    puts "#{full_name} #{gait} forward"
  end
end


class Person
  include Walkable
  attr_reader :name

  def initialize(name)
    @name = name
  end

  private

  def gait
    "strolls"
  end
end

class Cat
  include Walkable
  attr_reader :name

  def initialize(name)
    @name = name
  end

  private

  def gait
    "saunters"
  end
end

class Cheetah < Cat
  private

  def gait
    "runs"
  end
end

class Noble < Person
  attr_reader :title
  def initialize(name, title)
    super(name)
    @title = title
  end

  # def walk # Trade-off with this approach is that if I want to modify walk in the future, I would have to change it here as well. Alternative is to redefine walk to use a full_name which I include in all the classes, and make it prepend the title for Nobles.
    
  #   puts "#{title } #{name} #{gait} forward"
  # end

  private

  def gait
    "struts"
  end
end

# Now that we have a Walkable module, we are given a new challenge. Apparently some of our users are nobility, and the regular way of walking simply isn't good enough. Nobility need to strut.

# We need a new class Noble that shows the title and name when walk is called:

byron = Noble.new("Byron", "Lord")
byron.walk

# => "Lord Byron struts forward"

# We must have access to both name and title because they are needed for other purposes that we aren't showing here.
p byron.name
p byron.title

flash = Cheetah.new("Flash")
flash.walk

kitty = Cat.new("Kitty")
kitty.walk

mike = Person.new("Mike")
mike.walk