class Address < ApplicationRecord
	belongs_to :user
	validates :name, presence: true
	validates :address, presence: true
	validates :postal_code, presence: true
	validates :tel, presence: true
end
