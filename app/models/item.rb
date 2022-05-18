class Item < ApplicationRecord

  # 商品画像表示用
  has_one_attached :image

end
