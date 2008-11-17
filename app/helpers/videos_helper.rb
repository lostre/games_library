module VideosHelper

	def vid_display(video)
		video.type.new(video).embed_html
	end
	
end