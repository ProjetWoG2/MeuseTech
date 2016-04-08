class PagesController < ApplicationController
	before_action :authenticate_compte!, only: [:moderation]
	
	
  def index 
  end
    
  def pourquoi
  end	
  
end
