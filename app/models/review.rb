class Review < ApplicationRecord
	belongs_to :product
	belongs_to :user

	validates :title, presence: true
	validates :body, presence: true
end
