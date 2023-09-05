#Q1

class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

# What is the result of executing the following code:

oracle = Oracle.new
oracle.predict_the_future

# A string will be returned starting with "You will " and ending with one of the three strings in the array returned by #choices

#Q2

class RoadTrip < Oracle
  def choices
    ["visit Vegas", "fly to Fiji", "romp in Rome"]
  end
end

# What is the result of the following:

trip = RoadTrip.new
trip.predict_the_future

# As in Q1, a string of form "You will <something>" will be returned but in this case the choices method defined in RoadTrip subclass overwrites the one defined in Oracle, so the strings sampled will now be the ones defined in RoadTrip#choices. Even though predict_the_future is defined in `Oracle`, the lookup path for `choices` starts in the calling object's class before working its way up the inheritance chain.