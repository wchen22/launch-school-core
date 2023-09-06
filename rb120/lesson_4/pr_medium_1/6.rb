# If we have these two methods in the Computer class:
# What is the difference in the way the code works?

class Computer
  attr_accessor :template

  def create_template
    @template = "template 14231"
  end

  def show_template
    template
  end
end

class Computer
  attr_accessor :template

  def create_template
    @template = "template 14231"
  end

  def show_template
    self.template
  end
end

# In both class definitions attr_accessor is used to create the getter and setter methods for @template. 

# The difference is in show_template, where the first class's method calls the reader instance method. The second class uses self.template, which calls template on the current instance, self. So in effect they do the same thing. The Ruby style guide prefers avoiding self where not required, so the first class definition is preferred.