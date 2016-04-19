class ActualitesController < ApplicationController
  
  def show
    @actualite = Actualite.find(params[:id])
    @actualites = Actualite.order(created_at: :desc)
    @comments = @actualite.comments.all
  end
    
    
  def new
    @actualite=Actualite.new
  end
    
  def create
    @actualite = Actualite.new(actualite_params)
    @actualite.user_id = current_user.id
    if @actualite.save
      redirect_to @actualite
    else
      render :new
    end
  end
    
  def edit
   @actualite = Actualite.find(params[:id])
  end
    
  def update
   @actualite = Actualite.find(params[:id])
	
   if @actualite.update(actualite_params)
       redirect_to last_actu_path, :notice => "Actualité mise à jour."
   else
      redirect_to last_actu_path, :notice => "L'actualité n'a pas été mise à jour."
   end
   
  end
    
  def add_new_comment
    actualite = Actualite.find(params[:id])
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    actualite.comments << @comment
    redirect_to :action => :show, :id => actualite
  end
    
  def last_actu
    if Actualite.last
      @actualite = Actualite.last.id
      redirect_to actualite_path(@actualite)
    else
      redirect_to actualites_path
    end
  end    
    
  def destroy
      @actualite = Actualite.find(params[:id])
      @actualite.destroy!
      redirect_to last_actu_path, :notice => "Actualité supprimée."
  end
    
    
  private
  def actualite_params
      params.require(:actualite).permit(:title, :content, :created_at, :updated_at, :user_id)
  end
  def comment_params
      params.require(:comment).permit(:comment, :title, :user_id)
  end
    
end
