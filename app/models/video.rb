class Video < ActiveRecord::Base
	acts_as_video_fu
	belongs_to	:game
end
