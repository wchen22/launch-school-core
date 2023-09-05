# If I have the following class: Which one of these is a class method (if any) and how do you know? How would you call a class method?

class Television
  def self.manufacturer
    # method logic
    p 'sony'
  end

  def model
    # method logic
  end
end

# Television::manufacturer is a class method since it's defined with `self` prefix at the class level. 

# Can call with Television.manufacturer or Television::manufacturer