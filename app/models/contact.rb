class Contact < ApplicationRecord
	belongs_to :user

	validates :contact_text, presence: true
end
