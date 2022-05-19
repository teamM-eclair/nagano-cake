class CartItem < ApplicationRecord

  # アソシエーション
  belongs_to :customer
  belongs_to :item
  # 未入力での注文防止
  validates :amount, presence: true

end
