class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :orders, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_products, through: :favorites, source: :product, dependent: :destroy
  has_many :addresses, dependent: :destroy
  has_many :carts, dependent: :destroy
  has_many :contacts, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :cards, dependent: :destroy

  def full_name
    self.last_name + self.first_name
  end

  validates :first_name, presence: true
  validates :last_name, presence:true
  validates :postal_code, presence: true, length: { minimum: 7 }
  validates :address, presence: true
  validates :tel, presence: true, length: { maximum: 13 }


end
