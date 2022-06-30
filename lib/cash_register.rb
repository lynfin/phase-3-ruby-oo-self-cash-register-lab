require 'pry'

class CashRegister
  attr_accessor :total, :discount, :items, :transactions

  def initialize(discount = 0)
    @total = 0.0
    @discount = discount
    @items = []
    @transactions = []
    self
  end

  def add_item(title, price, quantity = 1)
    self.total += price * quantity
    quantity.times do
      items << title
    end
    transaction = { price: price, quantity: quantity, title: title }
    transactions.push(transaction)
  end

  def apply_discount
    # binding.pry
    if discount != 0
      self.total *= (100 - discount) / 100.0
      "After the discount, the total comes to $#{@total.to_i}."
    else
      'There is no discount to apply.'
    end
  end

  def void_last_transaction
    last_transaction = transactions.pop
    self.total -= last_transaction[:price] * last_transaction[:quantity]
  end
end
