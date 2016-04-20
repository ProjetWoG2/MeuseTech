class UsersController < ApplicationController	

  before_action :login_required, except: [ :index, :show ]
  before_action only: [:show, :update, :destroy, :edit] do
    :role_required
    :owner_required
  end
    
    
  def edit
    render :edit    
  end
	
  def destroy
    #action d'effacement de l'utilisateur
    @user.destroy
    flash[:notice] ="L'utilisateur a été effacé."   
    redirect_to action: "index"
  end
	
  def update
      @user = User.find(params[:id])
      @comments = Comment.where(user_id: @user.id).where(role: "comments")
	  if @user.update(compte_params)
        if @user.confiance
            @comments.each do |comment|
              comment.update(visible: true)
            end
        end
        flash[:notice] = "L'utilisateur a été mis à jour."
        redirect_to :back
      else
        flash[:alert] = "L'utilisateur n'a pas été mis à jour."
        redirect_to :back
      end
  end
	
  def index
    @users = User.all.drop(1)
    @roles = Role.all.drop(1)
    render :index
  end

  def show
    if exists
        render :show
    else
        redirect_to action: "index"
    end
  end

  def validate
    @user = User.find(params[:id])
  end

  private

  def compte_params
      params.require(:user).permit(:confiance)
  end

  def exists
    if User.exists?(params[:id])
      @user = User.find(params[:id])
      return true
    else
      flash[:alert] ="L'utilisateur n'existe pas."  
      return false
    end
  end

end
