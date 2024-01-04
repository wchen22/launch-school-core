
class NoExperienceError < StandardError
end
  
class Value
  attr_reader :value, :list
  def initialize(value)
    @value = value
    @list = [1,2,3]
  end

  def odd?
    @value.odd?
  end

  def downcase
    @value.downcase
  end

  def hire
    raise NoExperienceError, "This guy needs more experience"
  end

  def process
    self
  end

end
