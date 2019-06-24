class Product < ApplicationRecord
	validates :price, numericality: { only_integer: true }
	validates :stock, numericality: { only_integer: true }
	validates :product_name, presence: true
	validates :genre_id, presence: true
	validates :label_id, presence: true

	has_many :users, through: :carts
	has_many :carts
	has_many :favorites
	#has_many :users, through: :favorites
	has_many :reviews
	#has_many :users, through: :reviews
	has_many :orders, through: :order_details
	has_many :order_details

	has_many :artist_products, dependent: :destroy
	has_many :artists, through: :artist_products
	accepts_nested_attributes_for :artist_products, allow_destroy: true
	accepts_nested_attributes_for :artists, allow_destroy: true

	belongs_to :genre
	belongs_to :label

	has_many :disks
	accepts_nested_attributes_for :disks, reject_if: :all_blank, allow_destroy: true

	attachment :jacket_img

	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end

end
