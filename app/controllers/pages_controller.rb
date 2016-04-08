class PagesController < ApplicationController
	before_action :authenticate_compte!, only: [:moderation]
	
	
  def index 
  end
    
  def pourquoi
  end
	
	def moderation
		@comptes = Compte.order(id: :asc)	
		@statuts = Statut.all.drop(1)
			
	end
end
