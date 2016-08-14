class RecipesController < ApplicationController
	
	before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
	before_action :set_recipe, only: [:show, :edit, :update, :destroy]

	def index
		@recipes = Recipe.all.order('created_at DESC')
	end

	def show
	end

	def new
		@recipe = Recipe.new
	end

	def create
		@recipe = Recipe.new(recipe_params)
		@recipe.user = current_user
		
		if @recipe.save
			redirect_to show_recipe_path(@recipe)
		else
			flash[:danger] = "Could not create a new recipe."
			render 'new'
		end
	end
	
	def edit
	end

	def update
		if @recipe.update(recipe_params)
			flash[:success] = "Successfully edited your recipe."
			redirect_to show_recipe_path(@recipe)
		else
			flash[:danger] = "Couldn't edit your recipe."
			render 'edit'
		end
	end

	def destroy
	end
	
	private
	
	def recipe_params
		params.require(:recipe).permit(:name, :summary, :description)
	end
	
	def set_recipe
		@recipe = Recipe.find(params[:id])
	end
	
end