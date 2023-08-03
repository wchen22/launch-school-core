# There is nothing technically incorrect about this class, but the definition may lead to problems in the future. How can this class be fixed to be resistant to future problems?

class Flight
  attr_accessor :database_handle 
  
    def initialize(flight_number)
      @database_handle = Database.init # Presumably creates a new Database object and assigns it to instance variable
      @flight_number = flight_number
    end 
  end
  
  # @database_handle doesn't seem like it should have a reason for users of the class to read or write to it, so we can remove the attr_accessor.