# Create a class 'Student' with attributes name and grade. Do NOT make the grade getter public, so joe.grade will raise an error. Create a better_grade_than? method, that you can call like so...

class Student
  attr_accessor :name
  attr_writer :grade

  def initialize(name, grade)
    self.name = name
    self.grade = grade
  end

  
  def better_grade_than?(student)
    self.grade > student.grade
  end

  protected

  attr_reader :grade
end

joe = Student.new("Joe", 100)
bob = Student.new("Bob", 88)


puts "Well done!" if joe.better_grade_than?(bob)