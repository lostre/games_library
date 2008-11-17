class Vimeo
  include HTTParty
  format :json
  base_uri 'vimeo.com'
  default_params :output => 'json'
  
  def initialize(obj)
    @clip_id  = obj.video_url.split('/').last
    @response = self.class.get('/api/oembed.json', :query => {:url => "http://vimeo.com/#{@clip_id}", :byline => "0", :color => "c9ff23"})
  end
  
  def thumbnail_url
    @response["thumbnail_url"]
  end
  
  def embed_html
    @response["html"]
  end
  
end
