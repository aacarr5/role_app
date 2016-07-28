class CategoriesController < ApplicationController

	def index
		@categories = Category.all
	end

	def show
		binding.pry
		@category = Category.find_by(id:params[:id])
	end

end
