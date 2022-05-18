class Item < ApplicationRecord

  # 商品画像表示用
  has_one_attached :image
  # アソシエーション
  belongs_to :genre
  has_many :cart_items, dependent: :destroy
  has_many :order_details, dependent: :destroy

  # 画像未投稿時の対処
  def image
    (image.attached?) ? image : 'no_image.jpg'
  end

end
