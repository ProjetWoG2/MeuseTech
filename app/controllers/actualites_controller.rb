class ActualitesController < ApplicationController
  
  def show
    @actualite = Actualite.find(params[:id])
  end
    
    
  def new
    @actualite=Actualite.new
  end
    
  def create
    @actualite = Actualite.new(actualite_params)
    @actualite.save
    redirect_to @actualite
  end
    
  private
  def actualite_params
      params.require(:actualite).permit(:title, :content, :created_at, :updated_at, :user_id)
  end
    
end
