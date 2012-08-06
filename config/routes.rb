TdoBerkeleyEdu::Application.routes.draw do
  root :to => 'home#index'

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  match 'about' => 'home#about'

  devise_for :users

  match 'book/syllabus' => 'book#syllabus', :via => :get, :as => :syllabus
  resources :book, :only => [:index, :show]
  match 'book/chapter/:id' => 'book#chapter', :via => :get, :as => :book_chapter

  # Shared resources
  match '/shared_resources/:id/:filename' => 'shared_resource#download', :via => :get

  resources :user

  # Admin routes
  # match "admin" => 'admin#index'
  # match "admin/new_user" => 'admin#new_user', :as => :new_user
  # match "admin/create_user" => 'admin#create_user', :as => :create_user, :via => :post

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
