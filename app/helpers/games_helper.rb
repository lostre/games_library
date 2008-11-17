module GamesHelper
	def tba_when_blank(release_date)
		release_date.blank? ? "TBA" : release_date.to_formatted_s(:rfc822)
	end
	def check_availability(available)
		if available == true 
			result = "Yes"
		else
			result = "No"
		end
	end
	def na_when_blank(value)
		value.blank? ? "Not Available" : value
	end
	def add_video_link(name)
		link_to_function name do |page|
			page.insert_html :bottom, :videos, :partial => 'video', :object => Video.new
		end
	end
	def check_search_results(results)
		results.blank? ? "Listing all games" : "Search results on ''<b style='color:#ADB102;'>#{results}</b>''"
	end
	 	

end
