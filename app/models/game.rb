class Game < ActiveRecord::Base
	
	def to_param
		"#{id}-#{name.downcase.gsub(/[^[:alnum:]]/,'-')}".gsub(/-{2,}/,'-')
	end
	## Results per page (paginate)
    def self.per_page
      12
    end
	
	after_update 		:save_videos
##	Defining relationships
	belongs_to		 	:category
	has_many				:videos, :dependent => :destroy
	acts_as_textiled 	:minrequirement, :recrequirement
	
	validates_associated 	:videos
##	Main Validation Rules
	validates_presence_of	:name	
	
##	Paperclip options
	has_attached_file	:image , :styles => { :small => "150x150>", :medium => "300x300>" },
						:url => "/assets/games/:id/:style/:basename.:extension",
						:path => ":rails_root/public/assets/games/:id/:style/:basename.:extension",
						:default_url => "/assets/games/missing_:style.gif"

	validates_attachment_size :image, :less_than => 5.megabytes
	validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/png', 'image/jpg', 'image/gif']
	
	
	named_scope			:recent, lambda { |*args| {:conditions => ["(available = 't') AND release_date > ?",
										 (args.first || 2.weeks.ago)], :limit => "5"} }
	
	def self.search(search, page)
		if search
			paginate 	:page => page,
						    :conditions => ['name LIKE ?', "%#{search}%"],
						    :order => 'name'
		else
			paginate	:page => page,
						    :order => 'name'
		end
	end
		
	def new_video_attributes=(video_attributes)
		video_attributes.each do |attributes|
			videos.build(attributes)
		end
	end
	
	def existing_video_attributes=(video_attributes)
		videos.reject(&:new_record?).each do |video|
			attributes = video_attributes[video.id.to_s]
			if attributes
				video.attributes = attributes
			else
				videos.delete(video)
			end
		end
	end
	
	def save_videos
		videos.each do |video|
			video.save(false)
		end
	end
end