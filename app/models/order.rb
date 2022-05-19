class Order < ApplicationRecord

  # アソシエーション
  belongs_to :customer
  has_many :order_details, dependent: :destroy

  #enumにて支払方法の数値と文字列の紐付け
  enum payment_method: { credit_card: 0, transfer: 1 }
end
