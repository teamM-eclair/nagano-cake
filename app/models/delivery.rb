class Delivery < ApplicationRecord

  # アソシエーション
  belongs_to :customer
  # バリデーション
  validates :postcode, presence: true
  validates :address, presence: true

  #注文情報入力画面の登録済住所の選択肢に(郵便番号、住所、宛名)を表示させる(なぽ)
  def address_display
    '〒' + postcode + ' ' + address + ' ' + name
  end
end
