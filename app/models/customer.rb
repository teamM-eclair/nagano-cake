class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :orders, dependent: :destroy

  validates :password,
    length: { minimum: 6 }

  validates :email,
    uniqueness: true
  
  enum status: { register: 0, unregister: 1 }

end
