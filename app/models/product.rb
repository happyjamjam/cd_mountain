class Product < ApplicationRecord


	belongs_to :genre
	belongs_to :label
	has_many :users, through: :carts
	has_many :carts
	has_many :disks
	accepts_nested_attributes_for :disks
	has_many :favorites
	#has_many :users, through: :favorites
	has_many :reviews
	has_many :users, through: :reviews
	has_many :orders, through: :order_details
	has_many :order_details

	attachment :jacket_img

	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end

end
