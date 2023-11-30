# On lines 37 and 38 of our code, we can see that grace and ada are located at the same coordinates. So why does line 39 output false? Fix the code to produce the expected output.

class Person
attr_reader :name
attr_accessor :location

def initialize(name)
  @name = name
end

def teleport_to(latitude, longitude)
  @location = GeoLocation.new(latitude, longitude)
end
end

class GeoLocation
attr_reader :latitude, :longitude

def initialize(latitude, longitude)
  @latitude = latitude
  @longitude = longitude
end

def to_s
  "(#{latitude}, #{longitude})"
end

def == (other_location)
  latitude == other_location.latitude &&
  longitude == other_location.longitude
end

end

# Example

ada = Person.new('Ada')
ada.location = GeoLocation.new(53.477, -2.236)

grace = Person.new('Grace')
grace.location = GeoLocation.new(-33.89, 151.277)

ada.teleport_to(-33.89, 151.277)

puts ada.location                   # (-33.89, 151.277)
puts grace.location                 # (-33.89, 151.277)
puts ada.location == grace.location # expected: true
                                  # actual: false


# The objects being compared here are two Geolocation helper objects, one for Ada and the other for Grace. However, since we haven't defined an `==` method for the Geolocation class, it will default to the standard BasicObject superclass `==` method, which returns true if both arguments reference the same object. Since these are two distinct objects, it will return false. To fix this, we can create a `==` instance method for GeoLocation class and the criteria for equivalance should be if the latitude and longitude are the same. Since the latitude and longitude are floats, the Float#== method will be used.