class Music < ApplicationRecord

has_many :disks
accepts_nested_attributes_for :disks
has_many :artists
accepts_nested_attributes_for :artists

end
