class ActualitesController < ApplicationController
  
  def show
    @actualite = Actualite.find(params[:id])  
    @actualites = Actualite.order(created_at: :desc).last(10)
    @comments = @actualite.comments.where(visible: true).where(role: "comments")  
    @likes = @actualite.comments.where(role: "likes")
    @followers = @actualite.comments.where(role: "follows")
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
    @comment.role = "comments"
    if User.find(@comment.user_id).confiance == false
        @comment.visible = false
    else
        @comment.visible = true
    end
    actualite.comments << @comment
    if @comment.save
        add_new_notif("Nouveau Commentaire", "Actualite", actualite.id, User.where(role_id: 2))
        if User.find(@comment.user_id).confiance == false
            flash[:notice] = "Votre commentaire va être validé par un administrateur avant d'être mis en ligne!"
            User.all.each do |user|
                if user.role_id == 2
                    AdminMailer.nouveau_commentaire(user, @comment).deliver_now
                end
            end
            redirect_to :action => :show, :id => actualite
        else
            flash[:notice] ="Le commentaire a été mis en ligne."  
            redirect_to :action => :show, :id => actualite
        end
    end
  end
    
  def add_new_like
    actualite = Actualite.find(params[:id])
      if actualite.comments.where(role: "likes").where(user_id: current_user.id).count == 0
        @comment = Comment.new
        @comment.user_id = current_user.id
        @comment.role = "likes"
        @comment.visible = true
        actualite.comments << @comment
        if @comment.save
            flash[:notice] ="Contenu liké!"  
            redirect_to :action => :show, :id => actualite
        end
      else
          flash[:error] ="Vous avez déjà liké ce contenu!"
          redirect_to :action => :show, :id => actualite
      end
  end
    
    def add_new_notif(type, section, sujet, destinataires)
    destinataires.each do |destinataire|
      @notification = Notification.new
      @notification.contenu = type
      @notification.section = section
      @notification.sujet = sujet 
      @notification.destinataires = destinataire.id
      @notification.save
    end
  end
    
  def destroy_like
    actualite = Actualite.find(params[:id])
      if actualite.comments.where(role: "likes").where(user_id: current_user.id).count == 1
        Comment.destroy(Comment.where(role: "likes").where(user_id: current_user.id))
      end
      flash[:notice] ="Vous n'aimez plus ce contenu!"  
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
