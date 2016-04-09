class ComptesController < ApplicationController
	before_action :authenticate_superadmin!, only: [:destroy, :update, :edit]
	
	def edit
		@compte = Compte.find(params[:id])
  	end
	
	def destroy
        current_compte.destroy  
        redirect_to 'pages#index'
  	end
	
	def update
		 @compte = Compte.find(params[:id])
		 if @compte.update(compte_params)
			redirect_to "/comptes"
		 else
      		render :edit
    	end
  	end
	
  	def index
  		if compte_signed_in? 
  			if current_compte.statut.label == "SuperAdmin"
  				@comptes = Compte.order(id: :asc)	
				@statuts = Statut.all.drop(1)
  				render :supermoderation 			
  			elsif current_compte.statut.label == "Administrateur"
  				render :adminmoderation	
  			else
  				render :listecomptes
  			end
  		else 
            redirect_to root_path
  		end
  	end

  	def compte_params
		params.permit(:statut_id)
  	end

  
end
