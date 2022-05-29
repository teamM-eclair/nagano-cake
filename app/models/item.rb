class Item < ApplicationRecord

  # 商品画像表示用
  has_one_attached :image
  # アソシエーション
  belongs_to :genre
  has_many :cart_items, dependent: :destroy
  has_many :order_details, dependent: :destroy

    # 未入力での投稿防止
  validates :name, presence: true, uniqueness: true
  validates :unit_price, presence: true

  # 画像未投稿時の対処
  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end

  # 消費税を求めるメソッド
  def with_tax_price
    (unit_price * 1.1).floor
  end

  #enumにて販売ステータスと文字列の紐づけ(きむ)
  enum sales_status: { sale: 0, sold: 1 }

end
