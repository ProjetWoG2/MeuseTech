class ProjetsController < ApplicationController
  
    
  def show
    @projet = Projet.find(params[:id])
    @comments = @projet.comments.all
  end
  
  def index
    @projets = Projet.order(created_at: :desc)
  end
    
  def new
    @projet = Projet.new
    @categories = list_categories
  end
    
  def create
    @projet = Projet.new(projet_params)
    @projet.user_id = current_user.id
    @projet.labellise = false
    if @projet.save
      User.all.each do |user|
          if user.role_id == 2
            AdminMailer.nouveau_projet(user, @projet).deliver_now
          end
      end
      redirect_to @projet
    else
      render :new
    end
  end

  def edit
   @projet = Projet.find(params[:id])
   @categories = list_categories
  end
    
  def labelize
    @projet = Projet.find(params[:id])
  end
    
  def update
   @projet = Projet.find(params[:id])
	
   if @projet.update(projet_params)
       redirect_to projets_path, :notice => "Le projet a été mis à jour."
   else
       redirect_to projets_path, :notice => "Le projet n'a pas été mis à jour."
   end
  end

  def destroy
    @projet = Projet.find(params[:id])
    @projet.destroy!
    redirect_to projets_path, :notice => "Projet supprimé."
  end
    
  def add_new_comment
    projet = Projet.find(params[:id])
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    projet.comments << @comment
    if @comment.save
        if User.find(@comment.user_id).confiance == false
            flash[:notice] = "C'est votre premier commentaire! Il va être validé par un administrateur avant d'être mis en ligne!"
            redirect_to :action => :show, :id => projet
        else
            flash[:notice] ="Le commentaire a été mis en ligne."  
            redirect_to :action => :show, :id => projet
        end
    end
  end
    
    
  def list_categories
    Thematique.all.collect do |them|
      [them.categorie, them.id]
    end
  end
    
private
  def projet_params
        params.require(:projet).merge(checked_statuts).permit(:titre, :categorie_id, :created_at, :updated_at, :commune, :demarrage, :localisation, :statut, :description, :besoin, :image, :urlsite, :user_id, :labellise)
  end
    
  def comment_params
      params.require(:comment).permit(:comment, :title, :user_id)
  end

  def checked_statuts
    return {} unless params[:statut]
    string_of_values = params.require(:statut).map{ |key, val| key if val == "1" }.compact.join("/")
    {statut: string_of_values}
  end
    
    
end
