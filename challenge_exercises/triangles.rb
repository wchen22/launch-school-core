# Refactored

class Triangle
  def initialize(side1, side2, side3)
    @sides = [side1, side2, side3]
    raise ArgumentError, "Sides do not form a triangle" unless valid?
  end

  def kind
    case sides.uniq.size
    when 1 then "equilateral"
    when 2 then "isosceles"
    else "scalene"
    end
  end

  private
  attr_reader :sides

  def valid?
    sides.min.positive? && (sides.max < sides.sum - sides.max)
  end
end

# Original
# class Triangle
#   attr_reader :sides

#   def initialize(side_1, side_2, side_3)
#     @sides = [side_1, side_2, side_3]
#     check_invalid_sizes
#     check_invalid_triangle
#   end

#   def kind
#     if sides.uniq.size == 1
#       "equilateral"
#     elsif sides.uniq.size == 2
#       "isosceles"
#     else
#       "scalene"
#     end
#   end

#   private

#   def sum_of_other_two_sides(side)
#     temp_sides = @sides.dup
#     temp_sides.delete_at(@sides.index(side))
#     temp_sides.sum
#   end

#   def check_invalid_sizes
#     unless sides.min > 0
#       raise ArgumentError, "All sides must be 0 or greater in length"
#     end
#   end

#   def check_invalid_triangle
#     unless sides.all? {|side| side < sum_of_other_two_sides(side)}
#       raise ArgumentError, "No side can be greater than or equal to the sum of   the other sides"
#     end
#   end
# end