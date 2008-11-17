class CategoriesController < ApplicationController
	layout 'standard'
  before_filter :login_required
 	before_filter :has_permission?	
	def index
		@categories = Category.find(:all)
	end
	
	def show
		@category = Category.find(params[:id])
	end
	
	def edit
		@category = Category.find(params[:id])
	end
	
	def create
		@category = Category.new(params[:category])
		if @category.save
			render :partial => 'category', :object => @category
		end
	end
	
	def update
		@category = Category.find(params[:id])
		if @category.update_attributes(params[:category])
			flash[:notice] = 'Category was successfully updated.'
			redirect_to(categories_url)
		else
			render :action => "edit"
		end
	end
	
  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to(categories_url)
	end

end