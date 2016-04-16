class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
	include TheRole::Controller

	protect_from_forgery with: :exception
	before_action :configure_permitted_parameters, if: :devise_controller?
	

	def can_administer?
		current_user.moderator?(:sondages)
	end

	protected
	
	def configure_permitted_parameters
		devise_parameter_sanitizer.for(:sign_up) do |u|
			u.permit(:nom, :prenom, :pseudo, :email, :password, :password_confirmation)
    	end
  		devise_parameter_sanitizer.for(:sign_in) do |u|
			u.permit(:nom, :prenom, :pseudo, :email, :password, :password_confirmation)
    	end
		devise_parameter_sanitizer.for(:account_update) do |u|
			u.permit(:nom, :prenom, :pseudo, :email, :password, :password_confirmation)
    	end
	end
end
