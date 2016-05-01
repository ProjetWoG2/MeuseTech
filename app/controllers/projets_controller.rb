class ProjetsController < ApplicationController
  @@images_fond_show = [
    "brizeaux.JPG",
    "eglise_notre-dame_XI_mont-devant-sassey.jpg",
    "mirabelliers_cotes-de-meuse.jpg",
    "ordi_nature_01.JPG",
    "ordi_nature_02.JPG"
    ]

  @@images_fond_new = [
    "ordi_chiens_03.JPG",
    "ordi_ponton_04.JPG",
    "rdv_affaire_ordi_01.JPG",
    "barriere_01.JPG"
    ]

  def show
    @projet = Projet.find(params[:id])
    @likes = @projet.comments.where(role: "likes")
    @comments = @projet.comments.where(visible: true).where(role: "comments")
    @followers = @projet.comments.where(role: "follows")
    @image_fond = @@images_fond_show[rand(@@images_fond_show.length)]
  end
  
  def index
    @projets = Projet.order(created_at: :desc)
    @liencss = "projets.scss"
    @image_fond = "brizeaux.JPG"
  end

  def mes_projets
      @mes_projets = Projet.where(user_id: current_user.id)   
  end
    
  def projets_suivis
    @follows = Comment.where(user_id: current_user.id).where(role: "follows") 
    @projets_suivis = []
      @follows.each do |follow|
          projet = Projet.where(id: follow.commentable_id)
          @projets_suivis.push(projet)      
      end
  end
    
  def new
    @projet = Projet.new
    @categories = list_categories
    @image_fond = @@images_fond_new[rand(@@images_fond_new.length)]
  end
    
  def create
    @projet = Projet.new(projet_params)
    @projet.user_id = current_user.id
    @projet.labellise = false
    if @projet.save
      destinataires = []
      User.all.each do |user|
          if user.role_id == 2
            AdminMailer.nouveau_projet(user, @projet).deliver_now
            destinataires.push(user)
          end
      end
      add_new_notif("Nouveau Projet", "Projet", @projet.id, destinataires)
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
        
        owner = User.find(@projet.user_id)
        destinataires = []
        follows = Comment.where(role: "follows").where(commentable_type: "Projet").where(commentable_id: @projet.id)
        follows.each do |follow|
            follower = User.find(follow.user_id)
            if follower != owner
                destinataires.push(follower)
            end
        end
        admins = User.where(role_id: 2)
        admins.each do |admin|
            if admin != owner
                destinataires.push(admin)
            end
        end
        destinataires.push(owner)
       
       add_new_notif("Edition De Projet", "Projet", @projet.id, destinataires)
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
    @comment.role = "comments"
    if User.find(@comment.user_id).confiance == false
      @comment.visible=false
    else
      @comment.visible=true
    end
    projet.comments << @comment
    if @comment.save
        @owner = User.find(projet.user_id)
        @destinataires = []
        follows = Comment.where(role: "follows").where(commentable_type: "Projet").where(commentable_id: projet.id)
        follows.each do |follow|
            follower = User.find(follow.user_id)
            if follower != @owner
                @destinataires.push(follower)
            end
        end
        admins = User.where(role_id: 2)
        admins.each do |admin|
            if admin != @owner
                @destinataires.push(admin)
            end
        end
        @destinataires.push(@owner)
        add_new_notif("Nouveau Commentaire", "Projet", projet.id, @destinataires)
        
        
        if User.find(@comment.user_id).confiance == false
            flash[:notice] = "Votre commentaire va être validé par un administrateur avant d'être mis en ligne!"
            User.all.each do |user|
                if user.role_id == 2
                    AdminMailer.nouveau_commentaire(user, @comment).deliver_now
                end
            end
            redirect_to :action => :show, :id => projet
        else
            flash[:notice] ="Le commentaire a été mis en ligne."  
            redirect_to :action => :show, :id => projet
        end
    end
  end
    
  def add_new_like
      projet = Projet.find(params[:id])
      if projet.comments.where(role: "likes").where(user_id: current_user.id).count == 0
        @comment = Comment.new
        @comment.user_id = current_user.id
        @comment.role = "likes"
        @comment.visible = true
        projet.comments << @comment
        if @comment.save
            flash[:notice] ="Contenu liké!"  
            redirect_to :action => :show, :id => projet
        end
      else
          flash[:error] ="Vous avez déjà liké ce contenu!"
          redirect_to :action => :show, :id => projet
      end
  end
    
  def destroy_like
      projet = Projet.find(params[:id])
      if projet.comments.where(role: "likes").where(user_id: current_user.id).count == 1
        Comment.destroy(Comment.where(role: "likes").where(user_id: current_user.id))
      end
      redirect_to :action => :show, :id => projet
      flash[:notice] ="Vous n'aimez plus ce contenu!"  
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
    
  def add_new_follower
      projet = Projet.find(params[:id])
      if projet.comments.where(role: "follows").where(user_id: current_user.id).count == 0
        @comment = Comment.new
        @comment.user_id = current_user.id
        @comment.role = "follows"
        @comment.visible = true
        projet.comments << @comment
        if @comment.save
            flash[:notice] ="Contenu suivi!"  
            redirect_to :action => :show, :id => projet
        end
      else
          flash[:error] ="Vous suivez déjà ce contenu!"
          redirect_to :action => :show, :id => projet
      end
  end
    
  def destroy_follower
      projet = Projet.find(params[:id])
      if projet.comments.where(role: "follows").where(user_id: current_user.id).count == 1
        Comment.destroy(Comment.where(role: "follows").where(user_id: current_user.id))
      end
      redirect_to :action => :show, :id => projet
      flash[:notice] ="Vous ne suivez plus ce contenu!"  
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
