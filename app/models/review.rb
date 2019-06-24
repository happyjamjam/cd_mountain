class Review < ApplicationRecord
	belongs_to :product
	belongs_to :user

	attachment :jacket_img
end
