class ComptesController < ApplicationController
	before_action :authenticate_superadmin!, only: [:destroy, :update, :edit]
	
	def edit
		@compte = Compte.find(params[:id])
  	end
	
	def destroy
		@compte = Compte.find(params[:id])
		@compte.destroy
		redirect_to moderation_path
  	end
	
	def update
		 @compte = Compte.find(params[:id])
		 if @compte.update(compte_params)
			redirect_to moderation_path
		 else
      		render :edit
    	end
  	end
	
	def compte_params
		params.permit(:statut_id)
  	end
  
end
