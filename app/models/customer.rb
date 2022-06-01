class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :image

  has_many :oders

  has_many :cart_items

  has_many :addresses, dependent: :destroy

  def active_for_authentication?
    super && (is_deleted == false)
  end
  
  
def address_display
  '〒' + postal_code + ' ' + address + ' ' + first_name + last_name
end

end
