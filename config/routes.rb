Rails.application.routes.draw do


  resources :credit_app_lockers
  resources :contact_stores
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
  get 'admin/sale'
  get 'admin/set_sale'
  get 'admin/sold'
  get 'admin/set_sold'
  get 'admin/pending'
  get 'admin/set_pending'
  get 'vehicles/set_pending'
  get 'vehicles/set_sold_edit'
  get 'vehicles/set_sale_edit'


  match 'admin/admin_thumb_gen',            to: 'admin#admin_thumb_gen',           via: 'get'
  match 'admin/user_thumb_gen',            to: 'admin#user_thumb_gen',           via: 'get'
  match 'admin/edit_form',         to: 'admin#edit_form',        via: 'get'

  match 'admin/sale',            to: 'admin#sale',           via: 'get'
  match 'admin/sold',            to: 'admin#sold',           via: 'get'
  match 'admin/pending',         to: 'admin#pending',        via: 'get'

  match 'admin/set_sale',            to: 'admin#set_sale',           via: 'get'
  match 'admin/set_sold',            to: 'admin#set_sold',           via: 'get'
  match 'admin/set_pending',         to: 'admin#set_pending',        via: 'get'
  match 'admin/set_price',         to: 'admin#set_price',        via: 'get'




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
