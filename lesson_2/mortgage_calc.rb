# Take everything you've learned so far and build a mortgage calculator (or car payment calculator -- it's the same thing).

# You'll need three pieces of information:

#     the loan amount
#     the Annual Percentage Rate (APR)
#     the loan duration

# From the above, you'll need to calculate the following things:

#     monthly interest rate
#     loan duration in months
#     monthly payment

# You can use the following formula:

# m = p * (j / (1 - (1 + j)**(-n)))

# m = monthly payment
# p = loan amount
# j = monthly interest rate
# n = loan duration in months

# When you write your program, don't use the single-letter variables m, p, j, and n; use explicit names. For instance, you may want to use loan_amount instead of p.

# Given 
#   -loan amount p
#   -APR => convert/calculate monthly interest rate and assign to j
#   -loan duration (years)=> convert to months (just divide by 12) and assign to n 
# Calculate monthly payment m = p * (j / (1 - (1 + j)**(-n)))

def prompt(msg)
  Kernel.puts("=> #{msg}")
end

def validate_number(num)
  num > 0 # no strings=, negative numbers, or 0.
end

prompt("Welcome to the mortgage calculator! I will tell you your monthly payment based on your loan amount, APR, and loan duration.")

loop do # main loop
  loan_amount = 0
  loop do
    prompt("What is the loan amount in dollars?")
    loan_amount = gets.chomp.to_i
    if validate_number(loan_amount)
      break
    else
      prompt("That doesn't seem right. Please enter a positive value.")
    end
  end

  loan_years = 0
  loop do
    prompt("How many years is the loan for?")
    loan_years = gets.chomp.to_i
    if validate_number(loan_years)
      break
    else
      prompt("That doesn't seem right. Please enter a positive value.")
    end
  end

  loan_apr = 0
  loop do
    prompt("What is the APR of the loan? Please enter it in percentage points (e.g. 5 instead of .05 for 5%).")
    loan_apr = gets.chomp.to_f
    if validate_number(loan_apr)
      break
    else
      prompt("That doesn't seem right. Please enter a positive value.")
    end
  end

  loan_months = loan_years.to_i * 12
  monthly_interest = (loan_apr / 100) / 12
  monthly_payment = loan_amount * (monthly_interest / (1 - (1 + monthly_interest)**(-loan_months)))

  prompt("With a loan of $#{loan_amount} at #{loan_apr}% APR over #{loan_years} years, your monthly loan payment is $#{format('%.2f', monthly_payment)}")

  prompt("Would you like to do another calculation? (y/n)")
  response = gets.chomp
  next if response.downcase[0] == 'y'
  break
end

prompt("Thank you for using the mortgage calculator!")
