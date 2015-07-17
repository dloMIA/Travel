Rails.application.routes.draw do
  
  

  get 'password_resets/new'

  get 'password_resets/edit'

  get 'trips/index'

	
	
  resources :trips do
  	resources :microposts
  end
  
	
  
  resources :guest
  
	resources :commitment
	
  	root 'static_pages#home'
  	get 'login'  => 'sessions#new'
	post 'login'  => 'sessions#create'
	delete 'logout'  => 'sessions#destroy'
	
	post '/trips/:id/users/new' => 'trips#add_user', as: :add_user
	delete 'trips/:id/users/:user_id' => 'trips#remove_user', as: :remove_user
	post '/users/:id/trips/new' => 'users#add_trip', as: :add_trip
	delete '/users/:id/trips/:trip_id' => 'users#remove_trip', as: :remove_trip
	
	resources :filters
	resources :users
	resources :password_resets, only:[:new, :create, :edit, :update]
	
 
	
	# Need forms for creating new psswd and updating them
  
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
