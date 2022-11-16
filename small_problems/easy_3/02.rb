# Write a program that prompts the user for two positive integers, and then prints the results of the following operations on those two numbers: addition, subtraction, product, quotient, remainder, and power. Do not worry about validating the input.

# Example
# ==> Enter the first number:
# 23
# ==> Enter the second number:
# 17
# ==> 23 + 17 = 40
# ==> 23 - 17 = 6
# ==> 23 * 17 = 391
# ==> 23 / 17 = 1
# ==> 23 % 17 = 6
# ==> 23 ** 17 = 141050039560662968926103

def prompt(str)
  puts "==> " + str
end

prompt "Enter the first number:"
first = gets.chomp

prompt "Enter the second number:"
second = gets.chomp

operations = %w(+ - * / % **)

operations.each do |op|
  result = eval(first + op + second)
  prompt "#{first} #{op} #{second} = #{result}"
end

