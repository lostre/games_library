class Category < ActiveRecord::Base

	def to_param
		"#{id}-#{name.downcase.gsub(/[^[:alnum:]]/,'-')}".gsub(/-{2,}/,'-')
	end	
##	Defining relationships
	has_many		:games
##	has_one			:image

	validates_presence_of	:name
	
end