class Order < ApplicationRecord

  # アソシエーション
  belongs_to :customer
  has_many :order_details, dependent: :destroy

  #enumにて支払方法の数値と文字列の紐付け(なぽ)
  enum payment_method: { credit_card: 0, transfer: 1 }
  #enumにて配送先住所の数値と文字列の紐付け(なぽ)

  #enum address: { address: 0, delivery_address: 1, new_address: 2 } いらない

  #enumにて管理者/注文ステータスの数値と文字列の紐付け(さか)
  enum status: { awaiting_payment: 0, confirming_payment: 1, under_manufacture: 2, preparing_to_ship: 3, already_shipped: 4 }

  def subtotal
    item.with_tax_price * amount
  end
end
