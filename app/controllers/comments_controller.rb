class CommentsController < ApplicationController 
  
  def create
    @recipe = Recipe.find(params[:recipe_id])
    @comment = @recipe.comments.build(comment_params)
    @comment.chef = current_chef
    if @comment.save
      flash[:success] = "Comment has been created"
      redirect_to recipe_path(@recipe)
    else
      flash["danger"] = 'There was an error, try again'
      redirect_to :back
    end
  end
  
  private
  
    def comment_params
      params.require(:comment).permit(:description)
    end
  
end