class GamesController < ApplicationController
  layout 'standard'
  # Restfull_ACL Options
  before_filter :login_required, :except => ["index", "show", "category"]
  before_filter :has_permission?, :except => ["index", "show", "category"]

  def index
   	@games = Game.search(params[:search], params[:page])
  end
  
  def show
  	@game = Game.find(params[:id])
  end
  
  def new
    @game = Game.new
    @game.videos.build
	@categories = Category.find(:all)
  end
  
  def create
    @game = Game.new(params[:game])
    
	if @game.save
    	flash[:notice] = 'Game was successfully created.'
        redirect_to(@game)
    else
    	render :action => "new"
    end
  end
  
  def edit
    @game = Game.find(params[:id])
    @categories = Category.find(:all)  	
  end
  
  def update
	params[:game][:existing_video_attributes] ||= {} 	
  	@game = Game.find(params[:id])
          
    if @game.update_attributes(params[:game])
        flash[:notice] = 'Game was successfully updated.'
        redirect_to(@game)
    else
    	render :action => "edit"
    end
  end
  
  def destroy
    @game = Game.find(params[:id])
    @game.destroy
    redirect_to(games_url)
  end
  
  def category
  	@games = Game.paginate(:page => params[:page], :conditions => "category_id = #{params[:id]}", :order => 'name' )
  	@category = Category.find(params[:id])	
  end
    
end
