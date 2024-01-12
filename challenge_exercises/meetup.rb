require 'date'

class Meetup
  WEEKDAYS = %w(Monday Tuesday Wednesday Thursday Friday Saturday Sunday)
  TEENTHS = (13..19).to_a

  def initialize(year, month)
    @first_date = Date.civil(year, month)
  end

  def day(desired_day, string)
    desired_day_num = WEEKDAYS.index(desired_day.capitalize) + 1
    match_days = find_days(desired_day_num)
    
    case string.downcase
    when "first" then match_days[0]
    when "second" then match_days[1]
    when "third" then match_days[2]
    when "fourth" then match_days[3]
    when "fifth" then match_days[4]
    when "last" then match_days.last
    when "teenth" then match_days.select {|day| TEENTHS.include? day.day }.first
    end
  end

  def find_days(desired_day)
    match_days = []
    @first_date.upto(@first_date.next_month-1) do |date_object|
      match_days << date_object if date_object.cwday == desired_day
    end
    match_days
  end
end
