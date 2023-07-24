# class Human
#   def initialize(name)
#     @name = name
#     @name_reversed = @name.reverse
#     puts "#{@name}"
#   end

# end

# class Baby < Human
#   def initialize(name)
#     super
#     @name = name.upcase
#     puts "#{@name} from subclass"
#   end

#   def name_reversed
#     puts @name_reversed
#   end
# end

# avery = Baby.new("Avery")
# avery.name_reversed

# class Rock

# end

# rock = Rock.new

# def rock.info
#     "This is a rock object"
# end

# p rock.info
# boulder = Rock.new
# #p boulder.info
# p rock.info

# class Animal
#   @info = 'animal'
# end


# class Rock
#   @@info = 'class info' 

#   def initialize
#     @info = 'rock'
#   end
# end

# rock = Rock.new
# # puts rock.methods
# def rock.info
#   'rocks'
# end
# # p rock.methods

# p Rock.methods.include?(:info)

# def rock.weight
#   # def info
#   #   'info'
#   # end
#   # info = '123'

#   puts('534 ' + @@info)
# end

# rock.weight
# # boulder = Rock.new
# # p boulder.info

# # local variable -> self.method -> local method

# p Rock.ancestors


class Animal
  def initialize(name)
    @name = name
  end

  def speak
    puts sound
  end

  def sound
    "#{@name} says "
  end
end

class Cow < Animal
  def sound
    super + "moooooooooooo!"
  end
end

daisy = Cow.new("Daisy")
daisy.speak
