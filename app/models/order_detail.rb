class OrderDetail < ApplicationRecord

  # アソシエーション
  belongs_to :order
  belongs_to :item

  #enumにて管理者/製作ステータスの数値と文字列の紐付け(さか)
  enum product_status: { cannot_be_started: 0, awaiting_manufacture: 1, under_manufacture: 2, completion_of_production: 3 }
end
