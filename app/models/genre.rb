class Genre < ApplicationRecord
  has_many :i, dependent: :destroy
end
