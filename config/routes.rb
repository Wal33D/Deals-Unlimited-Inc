Rails.application.routes.draw do
 
  resources :vehicles
  resources :vehicles
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources "contacts", only: [:new, :create]
 
  get 'vehicles/cars'
  get 'vehicles/trucks'
  get 'vehicles/suvs'
  get 'vehicles/vans'
  get 'pages/welcome'
  get 'pages/finance'
  get 'pages/directions'
  get 'pages/policy'
  root 'pages#welcome'

  match '/contact',   to: 'contacts#new',       via: 'get'
  match '/policy',    to: 'pages#policy',       via: 'get'
  match '/faq',       to: 'pages#faq',          via: 'get'
  match '/finance',   to: 'pages#finance',      via: 'get'
  match '/directions',to: 'pages#directions',   via: 'get'
  match '/cars',      to: 'vehicles#cars',      via: 'get'
  match '/trucks',    to: 'vehicles#trucks',    via: 'get'
  match '/suvs',      to: 'vehicles#suvs',      via: 'get'
  match '/vans',      to: 'vehicles#vans',      via: 'get'
  match '/contacts',  to: 'contacts#new',             via: 'get'


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
