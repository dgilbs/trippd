Rails.application.routes.draw do
  get '/signup', to: 'users#new', as: 'signup'
  get '/login', to: 'sessions#new', as: 'login'
  get '/logout', to: 'sessions#destroy', as: 'logout'
  get '/destinations/:id/add_destination', to: 'trips#add_destination', as: 'add_destination'
  get '/destinations/:id/remove_destination', to: 'trips#remove_destination', as: 'remove_destination'
  get '/change_current_trip/:id', to: 'users#change_current_trip', as: 'change_current_trip'
  get '/destinations/:id/add_activity', to: 'trips#add_activity', as: 'add_activity'
  get '/trips/:id/remove_activity', to: 'trips#remove_activity', as: 'remove_activity'
  get '/analytics', to: 'pages#analytics', as: 'analytics'
  post '/packing_lists', to: 'packing_lists#create'
  post '/items', to: 'items#create' 
  post '/email_trip', to: 'trips#send_email', as: 'email_trip'


  root 'pages#home'

  resources :trips
  resources :users
  resources :sessions
  resources :destinations
  
end
