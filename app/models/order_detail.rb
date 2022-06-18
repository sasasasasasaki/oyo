class OrderDetail < ApplicationRecord


  belongs_to :order
  belongs_to :item
  
  enum payment_method: { credit_card: 0, transfer: 1 }
  
  enum making_status: { a: 0, b: 1, c: 2, d: 3 }
  
  def subtotal
    with_tax_price * self.amount
  end
  
  def with_tax_price
    (self.price * 1.1).floor
  end
end
