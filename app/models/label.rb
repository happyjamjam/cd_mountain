class Label < ApplicationRecord
	validates :label_name, presence: true

	has_many :products
end