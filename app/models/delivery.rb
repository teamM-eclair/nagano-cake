class Delivery < ApplicationRecord

  # アソシエーション
  belongs_to :customer
  # バリデーション
  validates :postcode, presence: true
  validates :address, presence: true

end
