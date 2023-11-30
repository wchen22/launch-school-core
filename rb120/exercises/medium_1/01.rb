# Consider the following class.

# Modify this class so both flip_switch and the setter method switch= are private methods.

# Further: Add a private getter for @switch to the Machine class, and add a method to Machine that shows how to use that getter.


class Machine

  def start
    self.flip_switch(:on)
  end

  def stop
    self.flip_switch(:off)
  end

  def status
    switch
  end

  private 

  attr_accessor :switch

  def flip_switch(desired_state)
    self.switch = desired_state
  end
end

robot = Machine.new
robot.start
p robot.status
