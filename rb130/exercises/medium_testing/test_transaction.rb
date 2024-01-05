require 'minitest/autorun'

require_relative 'transaction'

class TransactionTest < Minitest::Test
  def setup
    @transaction = Transaction.new(15)
  end

  # def test_prompt_for_payment
  #   amount_paid = StringIO.new("75\n87\n")
  #   transaction = Transaction.new(87)

  #   assert_output("You owe $87.\nHow much are you paying?\nThat is not the correct amount. Please make sure to pay the full cost.\nYou owe $87.\nHow much are you paying?\n") do
  #      transaction.prompt_for_payment(input: amount_paid)
  #   end

  #   assert_equal 87, transaction.amount_paid
  # end

  def test_prompt_for_payment
    transaction = Transaction.new(30)
    input = StringIO.new('30\n')
    output = StringIO.new
    transaction.prompt_for_payment(input: input, output: output)
    assert_equal 30, transaction.amount_paid
  end

end