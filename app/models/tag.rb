class Tag < ActiveRecord::Base
  has_many :taggings
  has_many :trips, through: :taggings

end
