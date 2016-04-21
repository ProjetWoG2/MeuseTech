class Users::SessionsController < Devise::SessionsController

   protected

    # This method tell sessions#create method to redirect to pages#index when login fails.
   def auth_options
       { scope: resource_name, recall: 'pages#index' }
   end

   def after_sign_in_path_for(resource)
    if resource.is_a?(User) && resource.is_ban
      sign_out resource
        flash[:error] = "Votre compte a été banni."
      root_path
    else
      super
    end
   end
end