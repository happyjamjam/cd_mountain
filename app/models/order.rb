class Order < ApplicationRecord

  belongs_to :user
  has_many :order_details
  has_many :products, through: :order_details
  validates :payment_method, presence: true

end

