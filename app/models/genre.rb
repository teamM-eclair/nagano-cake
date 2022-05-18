class Genre < ApplicationRecord

  # アソシエーション
  has_many :items, dependent: :destroy
  # 未入力での投稿防止
  validates :name, presence: true

end
