# How could you change the method name below so that the method name is more clear and less repetitive?

class Light
  attr_accessor :brightness, :color

  def initialize(brightness, color)
    @brightness = brightness
    @color = color
  end

  def status
    "I have a brightness level of #{brightness} and a color of #{color}"
  end

end

# If we have an instance assigned to a variable like `flashlight`, `flashlight.light_status` is a bit verbose. We could simply change the method to `status` so we could call `flashlight.status`.

flashlight = Light.new(300, "yellow")
puts flashlight.status