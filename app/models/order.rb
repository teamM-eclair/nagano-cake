class Order < ApplicationRecord

  # アソシエーション
  belongs_to :customer
  has_many :order_details, dependent: :destroy

  #enumにて支払方法の数値と文字列の紐付け(なぽ)
  enum payment_method: { credit_card: 0, transfer: 1 }
  #enumにて配送先住所の数値と文字列の紐付け(なぽ)
  enum address: { address: 0, delivery_address: 1, new_address: 2 }
  
end
