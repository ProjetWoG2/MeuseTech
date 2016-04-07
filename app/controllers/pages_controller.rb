class PagesController < ApplicationController
	before_action :authenticate_compte!, only: [:moderation]
	
	
  def index 
  end
    
  def pourquoi
  end
	
	def moderation
		@comptes = Compte.order(id: :asc)	
		@statuts = Statut.order(id: :asc)
		@labelstatuts = []
		@statuts.each do |statut|
			@labelstatuts.push(statut.label)
		end
			
	end
end
