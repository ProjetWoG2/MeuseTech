class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
	include TheRole::Controller

	protect_from_forgery with: :exception
	before_action :configure_permitted_parameters, if: :devise_controller?
	before_filter :is_ban

    def is_ban
        if current_user.present? && current_user.is_ban
            sign_out current_user
            flash[:error] = "Votre compte a été banni."
            root_path
        end
    end

	def can_administer?
		if current_user
			current_user.moderator?(:sondages)
		else 
			return false
		end
	end

	protected
	
	def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up) do |u|
			u.permit(:nom, :prenom, :pseudo, :email, :password, :password_confirmation)
        end
        devise_parameter_sanitizer.permit(:sign_in) do |u|
			u.permit(:nom, :prenom, :pseudo, :email, :password, :password_confirmation)
        end
        devise_parameter_sanitizer.permit(:account_update) do |u|
			u.permit(:nom, :prenom, :pseudo, :email, :password, :password_confirmation)
        end
	end
end
