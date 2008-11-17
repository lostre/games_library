class VideosController < ApplicationController
	before_filter :login_required, :except => ["index", "show"]
	
	def index
		@video = Video.first
	end
end
