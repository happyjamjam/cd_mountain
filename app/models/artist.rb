class Artist < ApplicationRecord
	has_many :artist_products
	has_many :products, through: :artist_products
end
