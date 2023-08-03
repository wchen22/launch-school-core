# Modify this code so it works. Do not make the amount in the wallet accessible to any method that isn't part of the Wallet class.

class Wallet
  include Comparable

  protected attr_reader :amount

  def initialize(amount)
    @amount = amount
  end

  def <=>(other_wallet)
    amount <=> other_wallet.amount
  end
end

bills_wallet = Wallet.new(500)
pennys_wallet = Wallet.new(465)
if bills_wallet > pennys_wallet
  puts 'Bill has more money than Penny'
elsif bills_wallet < pennys_wallet
  puts 'Penny has more money than Bill'
else
  puts 'Bill and Penny have the same amount of money.'
end

puts bills_wallet.amount

# Further Exploration
#This example is rather contrived and unrealistic, but this type of situation occurs frequently in applications. Can you think of any applications where protected methods would be desirable?

# Comparing sensitive information like social security numbers, passwords, account numbers, etc.

# With medical records you might want to sort patients based on sensitive medical data without exposing the specific underlying information