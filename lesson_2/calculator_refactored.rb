def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_number?(num)
  num.to_i != 0 || num == '0'
end

def operation_to_message(op)
  out = case op
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
  out
end

# Bonus feature methods
# Suppose we're building a scientific calculator, and we now need to account for inputs that include decimals. How can we build a validating method, called number?, to verify that only valid numbers -- integers or floats -- are entered?
def number?(num)
  num.to_f.to_s == num || num.to_i.to_s == num
end

prompt("Welcome to the Calculator! Enter your name:")
name = ''

loop do
  name = Kernel.gets().chomp()
  if name.empty?()
    prompt("Make sure to enter a valid name")
  else
    break
  end
end

prompt("Hi #{name}!")

loop do # main loop
  number1 = ''
  number2 = ''
  loop do
    prompt("What's the first number?")
    number1 = gets.chomp
    if valid_number?(number1)
      break
    else
      prompt("Hmm... that doesn't look like a valid number")
    end
  end

  loop do
    prompt("Please enter your second number:")
    number2 = gets.chomp
    if valid_number?(number2)
      break
    else
      prompt("Hmm.. that doesn't look like a valid number")
    end
  end

  operator_prompt = <<-MSG
  What is the desired operation?
      1 - add
      2 - subtract
      3 - multiply
      4 - divide
  MSG
  prompt(operator_prompt)

  operator = ''
  loop do
    operator = Kernel.gets().chomp()
    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt("Please enter a valid operator: 1, 2, 3 or 4")
    end
  end

  prompt("#{operation_to_message(operator)} the two numbers...")

  result =  case operator
            when '1'
              number1.to_i + number2.to_i
            when '2'
              number1.to_i - number2.to_i
            when '4'
              number1.to_f / number2.to_f
            when '3'
              number1.to_i * number2.to_i
            end
  prompt(result.to_s)

  prompt("Do you want to perform another calculation? (Y/N)")
  answer = Kernel.gets().chomp()
  break unless answer.downcase.start_with?('y')
end

prompt("Thanks for using the calculator!")
