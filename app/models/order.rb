class Order < ApplicationRecord

  belongs_to :customer
  has_many :order_details

  enum payment_method: { credit_card: 0, transfer: 1 }

  #enum shipping_cost: { money: 0, money_in: 1, make:2, send:3, sent:4}






end
