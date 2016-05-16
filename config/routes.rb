Rails.application.routes.draw do
  get '/signup', to: 'users#new', as: 'signup'
  get '/login', to: 'sessions#new', as: 'login'
  get '/logout', to: 'sessions#destroy', as: 'logout'
  post '/trip_destinations', to: 'trip_destinations#create'
  get '/trip_destinations/:id', to: 'trip_destinations#destroy'
  get '/destinations/:id/remove_destination', to: 'trips#remove_destination', as: 'remove_destination'
  get '/destinations/:id/remove_destination_from_trip', to: 'trips#remove_destination_from_trip', as: 'remove_destination_from_trip'
  get '/change_current_trip/:id', to: 'users#change_current_trip', as: 'change_current_trip'
  get '/destinations/:id/add_activity', to: 'trips#add_activity', as: 'add_activity'
  get '/trips/:id/remove_activity', to: 'trips#remove_activity', as: 'remove_activity'
  get '/trips/:id/remove_activity_from_trip', to: 'trips#remove_activity_from_trip', as: 'remove_activity_from_trip'
  get '/analytics', to: 'pages#analytics', as: 'analytics'
  post '/packing_lists', to: 'packing_lists#create'
  post '/items', to: 'items#create' 
  post '/email_trip', to: 'trips#send_email', as: 'email_trip'
  delete '/items/:id', to: 'items#destroy' 


  root 'pages#home'

  resources :trips
  resources :users
  resources :sessions
  resources :destinations
  
end
