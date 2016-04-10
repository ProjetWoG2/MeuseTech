class UsersController < ApplicationController	
	
	def edit
		if User.exists?(params[:id])      
      @user = User.find(params[:id])    
      render :edit
    else
      flash[:alert] ="L'utilisateur n'existe pas."
      redirect_to :back
    end 
  end
	
	def destroy
    if User.exists?(params[:id])      
      @user = User.find(params[:id])    
      #action d'effacement de l'utilisateur
      @user.destroy        
      flash[:notice] ="L'utilisateur a été effacé."   
      redirect_to action: "index"
    else
      flash[:alert] ="L'utilisateur n'existe pas."
      redirect_to :back
    end    
  end
	
	def update
	  if User.exists?(params[:id])      
      @user = User.find(params[:id])
      if @user.update(compte_params)  
        flash[:notice] ="L'utilisateur a été mis à jour."
        redirect_to action: "index"
      else
        flash[:alert] ="L'utilisateur n'a pas été mis à jour."
        redirect_to action: "index"
      end
    else
      flash[:alert] ="L'utilisateur n'existe pas."
      redirect_to :back
    end
  end
	
  def index
    @users = User.all
    @roles = Role.all
    render :index
  end

  def show
    if User.exists?(params[:id])      
      @user = User.find(params[:id])    
      render :show
    else
      flash[:alert] ="L'utilisateur n'existe pas."
      redirect_to action: "index"
    end
  end

  def compte_params
    params.permit(:role_id)
    end

end
