class OrderDetail < ApplicationRecord


  belongs_to :order
  belongs_to :item
  
  enum payment_method: { credit_card: 0, transfer: 1 }
  
  enum making_status: { a: 0, b: 1, c: 2, d: 3 }
end
