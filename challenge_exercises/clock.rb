class Clock
  def self.at(hour, minutes=0)
    new(hour, minutes)
  end

  def initialize(hour, minutes=0)
    @hour = hour
    @minutes = minutes
  end

  def +(minutes)
    new_hour, new_minutes = standardize_minutes(total_minutes + minutes)
    Clock.new(new_hour, new_minutes)
  end

  def -(minutes)
    new_hour, new_minutes = standardize_minutes(total_minutes - minutes)
    Clock.new(new_hour, new_minutes)
  end

  def to_s
    "#{format('%02d', @hour)}:#{format('%02d', @minutes)}"
  end

  def ==(other)
    self.to_s == other.to_s
  end

  private

  def total_minutes
    @hour * 60 + @minutes
  end

  def standardize_minutes(minutes)
    hours,minutes = minutes.divmod(60)
    hours %= 24
    [hours, minutes]
  end
end