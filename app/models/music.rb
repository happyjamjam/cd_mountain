class Music < ApplicationRecord

belongs_to :disk
has_many :artists
accepts_nested_attributes_for :artists

end
