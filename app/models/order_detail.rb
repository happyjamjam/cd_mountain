class OrderDetail < ApplicationRecord

  belongs_to :product
  belongs_to :ordering

end
