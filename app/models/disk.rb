class Disk < ApplicationRecord
	belongs_to :product
	has_many :musics
	accepts_nested_attributes_for :musics, reject_if: :all_blank, allow_destroy: true
end
