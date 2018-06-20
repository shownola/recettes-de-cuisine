class RecipesController < ApplicationController
  before_action :find_recipe, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [:index, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  
  
  def index
    @recipes = Recipe.all
  end
  
  def show
    
  end
  
  def new
    @recipe = Recipe.new
    # @recipe = current_chef.recipes.build
  end
  
  def create
    # @recipe.chef = current_chef
    # @recipe = current_chef.recipes.build(recipe_params)
    @recipe = Recipe.new(recipe_params)
    @recipe.chef = current_chef
    if @recipe.save
      flash[:success] = "You have successfully created a recipe"
      redirect_to recipe_path(@recipe)
    else
      render 'new'
    end
  end
  
  def edit
    
  end
  
  def update
    if @recipe.update(recipe_params)  
      flash[:success] = "Your recipe has been updated"
      redirect_to recipe_path(@recipe)
    else
      render 'edit'
    end
  end
  
  def destroy
    @recipe.destroy
    flash[:success] = "Your recipe has been deleted"
    redirect_to recipes_path
  end
  
  private
  
    def find_recipe
      @recipe = Recipe.find(params[:id])
    end
    
    def recipe_params
      params.require(:recipe).permit(:title, :description, :image, ingredients_attributes: [:id, :name, :_destroy], directions_attributes: [:id, :step, :_destroy])
    end
    
    def require_same_user
      if current_chef != @recipe.chef and !current_chef.admin?
        flash[:danger] = 'You can only edit or delete your own recipes'
        redirect_to recipes_path
      end
    end
  
  
  
end