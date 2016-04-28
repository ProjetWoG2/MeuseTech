class PagesController < ApplicationController
	
	
  def index 
    @derniers_projets=Projet.order(created_at: :desc).first(3)
    @projets=Projet.all
    
    @projets_actifs=Hash.new
    
    @projets.each do |projet|
        score = ((projet.comments.where(role:"comments").where(visible:true).count)*6)+(projet.comments.where(role: "likes").count)
        @projets_actifs[projet] = score
    end
    @projets_actifs = @projets_actifs.sort_by{|_key, value| value}.reverse.first(3)
    @derniers_commentaires=Comment.where(role: "comments").last(5)

    @image_fond = "aviron.jpg"
  end
    
  def pourquoi
  end	
  
end
