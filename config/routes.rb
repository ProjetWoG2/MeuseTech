Rails.application.routes.draw do

  root :to => 'pages#index'
  
  devise_for :users, path: 'users', skip: [:sessions],
           controllers: {
               sessions: 'users/sessions',
               registrations: 'registrations'
           }

  as :user do
    root 'pages#index', as: :new_user_session
    post 'users/sign_in' => 'users/sessions#create', as: :user_session
    get 'users/sign_out' => 'users/sessions#destroy', as: :destroy_user_session
    get 'users/' => 'users#index', as: :users
    get 'users/:id' => 'users#show', as: :user
    patch 'users/:id' => 'users#update', as: :change_user_role
    delete 'users/:id' => 'users#destroy', as: :destroy_user
  end


  TheRoleManagementPanel::Routes.mixin(self)
   
  resources 'actualites'

  resources 'projets'
  resources 'comments' 
  resources 'notifications' 
  resources 'users'


  get 'pourquoi' => 'pages#pourquoi'	
  
  delete 'actualites/:id' => 'actualites#destroy', as: :destroy_actualite
  patch 'actualites/update'
  get 'actualites/edit'
  get 'actualites/update'
  get 'derniere-actualite' => 'actualites#last_actu', as: :last_actu

  mount Rapidfire::Engine => "/sondages"


  get 'projets' => 'projets#index'   
  get 'projets/:id/labelize' => 'projets#labelize', as: :labelize_projet
  match "/projets/add_new_comment" => "projets#add_new_comment", :as => "add_new_comment_to_projets", :via => [:post]
  match "/actualites/add_new_comment" => "actualites#add_new_comment", :as => "add_new_comment_to_actualites", :via => [:post]
  match "/actualites/add_new_like" => "actualites#add_new_like", :as => "add_new_like_to_actualites", :via => [:post]
  match "/actualites/destroy_like" => "actualites#destroy_like", :as => "destroy_like_from_actualites", :via => [:post]
  match "/projets/add_new_like" => "projets#add_new_like", :as => "add_new_like_to_projets", :via => [:post]
  match "/projets/add_new_follower" => "projets#add_new_follower", :as => "add_new_follower_to_projets", :via => [:post]
  match "/projets/destroy_follower" => "projets#destroy_follower", :as => "destroy_follower_from_projets", :via => [:post]
  match "/projets/destroy_like" => "projets#destroy_like", :as => "destroy_like_from_projets", :via => [:post]
  get 'users/:id/validate' => 'users#validate', as: :validate_user
  get 'users/:id/ban' => 'users#ban', as: :ban_user

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
