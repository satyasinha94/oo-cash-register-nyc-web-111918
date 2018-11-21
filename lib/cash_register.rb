require 'pry'
class CashRegister

  attr_accessor :total, :discount, :last_transaction
  attr_reader :title, :price, :quantity
  def initialize(discount = nil)
    @total = 0
    @discount = discount
    @items = []
    @last_transaction = 0
  end

  def add_item(title, price, quantity = 1)
      self.total += price * quantity
      until quantity == 1
        items << title
        quantity -= 1
      end
      if quantity == 1
        items << title
        self.last_transaction = price
        quantity -= 1
      end
    end

  def apply_discount
    if !discount.nil?
       self.total -= self.total * @discount.to_f/100
       "After the discount, the total comes to $#{self.total.to_i}."
    else
       "There is no discount to apply."
    end
  end

  def items
    @items
  end

  def void_last_transaction
    self.total -= self.last_transaction
  end
end
