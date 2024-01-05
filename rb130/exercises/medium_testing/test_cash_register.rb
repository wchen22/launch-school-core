require 'minitest/autorun'
require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < Minitest::Test
  attr_reader :register
  
  def setup
    @register = CashRegister.new(100)
  end

  def test_accept_money
    purchase = Transaction.new(50)
    purchase.amount_paid = 50

    previous_amount = register.total_money
    register.accept_money(purchase)

    assert_equal previous_amount + purchase.amount_paid, register.total_money
  end

  def test_change
    purchase = Transaction.new(50)
    purchase.amount_paid = 60
    assert_equal register.change(purchase), purchase.amount_paid - purchase.item_cost
  end

  def test_give_receipt
    transaction = Transaction.new(10)
    assert_output("You've paid $10.\n") {register.give_receipt(transaction)}
  end

  def test_prompt_for_payment()
end