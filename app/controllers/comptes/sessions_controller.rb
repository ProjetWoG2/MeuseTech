class Comptes::SessionsController < Devise::SessionsController

   protected

    # This method tell sessions#create method to redirect to pages#index when login fails.
   def auth_options
       { scope: resource_name, recall: 'pages#index' }
   end

end