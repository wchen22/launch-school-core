# What will this print?

class Something
  def initialize
    @data = 'Hello'
  end

  def dupdata
    @data + @data
  end

  def self.dupdata
    'ByeBye'
  end
end

thing = Something.new
puts Something.dupdata # calls the class method `dupdata` which returns `ByeBye` to puts
puts thing.dupdata # calls the instance method which will return `HelloHello`` to puts