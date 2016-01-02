Rails.application.routes.draw do


  devise_for :admins
  resources :testimonials
  resources :vehicles 
  resources :meets
  resources "contacts", only: [:new, :create]
  resources "credits", only: [:new, :create]

   devise_scope :admin do get "/some/route" 
    match '/login',   to: 'devise/sessions#new',       via: 'get'
  end
  get 'admin/dashboard'
  get 'pages/welcome'
  get 'pages/directions'
  get 'pages/policy'
  get 'lookup/vin'

  match '/contact',              to: 'contacts#new',         via: 'get'
  match '/policy',               to: 'pages#policy',         via: 'get'
  match '/credit-application',   to: 'credits#new',          via: 'get'
  match '/credits',              to: 'credits#new',          via: 'get'
  match '/about',                to: 'pages#about',          via: 'get'
  match '/meet',                 to: 'meets#index',          via: 'get'
  match '/finance',              to: 'pages#finance',        via: 'get'
  match '/directions',           to: 'pages#directions',     via: 'get'
  match '/contacts',             to: 'contacts#new',         via: 'get'
  match '/print',                to: 'vehicles#print',       via: 'get'

  root 'pages#welcome'


end
