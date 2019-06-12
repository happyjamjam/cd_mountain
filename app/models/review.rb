class Review < ApplicationRecord
	belongs_to :product,:user
end
