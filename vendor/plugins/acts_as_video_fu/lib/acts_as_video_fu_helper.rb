module Mdarby
  module Acts #:nodoc:
    module Acts_as_video_fu_helper
  
      def display_video(obj)
        vidklass(obj).embed_html
      end
      
      def thumbnail_url(obj)
        vidklass(obj).thumbnail_url
      end
      
      
      private
      
        def vidklass(obj)
          obj.type.new(obj)
        end
        
    end
  end
end