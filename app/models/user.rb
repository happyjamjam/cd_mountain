class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :orders
  has_many :favorites
  has_many :favorite_products, through: :favorites, source: :product
  has_many :addresses
  has_many :carts
  has_many :contacts, dependent: :destroy
  has_many :reviews
  has_many :cards, dependent: :destroy

  def full_name
    self.last_name + self.first_name
  end


end
