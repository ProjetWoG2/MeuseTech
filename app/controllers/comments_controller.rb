class CommentsController < ApplicationController
  def index
    @comments = Comment.order(created_at: :desc)
  end
    
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy!
    redirect_to root_path, :notice => "Commentaire supprimé."
  end
  
  def edit
    @comment = Comment.find(params[:id])
  end
    
  def update
   @comment = Comment.find(params[:id])
	
   if @comment.update(comment_params)
     redirect_to root_path, :notice => "Le commentaire a été mis à jour."
   else
     redirect_to root_path, :notice => "Le commentaire n'a pas été mis à jour."
   end
  end
    
  def comment_params
    params.require(:comment).permit(:comment, :title, :user_id)
  end
    
end