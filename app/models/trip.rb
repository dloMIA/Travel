class Trip < ActiveRecord::Base
	has_many :users_trips, dependent: :destroy
	has_many :users, through: :users_trips
	has_many :taggings
	has_many :tags, through: :taggings
	has_many :microposts, dependent: :destroy
	
	def all_tags=(names)
	  self.tags = names.split(",").map do |name|
		  Tag.where(name: name.downcase.strip).first_or_create!
	  end
	end
 
	def all_tags
	  self.tags.map(&:name).join(", ")
	end

end
