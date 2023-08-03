#Assume you have the following code:

class House
  include Comparable
  attr_reader :price

  def initialize(price)
    @price = price
  end


  def <=>(other)
    price <=> other.price
  end
end

home1 = House.new(100_000)
home2 = House.new(150_000)
puts "Home 1 is cheaper" if home1 < home2
puts "Home 2 is more expensive" if home2 > home1


# and this output
# Home 1 is cheaper
# Home 2 is more expensive

# Modify the House class so that the above program will work. You are permitted to define only one new method in House.

# Further Exploration
# Is the technique we employ here to make House objects comparable a good one? (Hint: is there a natural way to compare Houses? Is price the only criteria you might use?) What problems might you run into, if any? Can you think of any sort of classes where including Comparable is a good idea?

# We could consider a house "greater than" another based on criteria other than price, such as square footage, number of stories, price, age, etc, so the implementation of the `Comparable` module here is somewhat unclear.

# Including Comparable might be more appropriate in cases where there is an obvious measure by which object of the same type can be compared. Examples that come to mind are elements of the periodic table (atomic number), or chess players (ELO)