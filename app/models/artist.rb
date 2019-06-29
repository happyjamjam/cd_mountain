class Artist < ApplicationRecord
	validates :artist_name, presence: true

	has_many :artist_products
	has_many :products, through: :artist_products
end
