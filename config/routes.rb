Rails.application.routes.draw do

  get '/signup', to: 'users#new', as: 'signup'
  get '/login', to: 'sessions#new', as: 'login'
  get '/logout', to: 'sessions#destroy', as: 'logout'
  get '/change_current_trip/:id', to: 'users#change_current_trip', as: 'change_current_trip'
  post '/trip_destinations', to: 'trip_destinations#create'
  get '/trip_destinations/:id', to: 'trip_destinations#destroy'
  post '/trip_activities', to: 'trip_activities#create'
  get '/trip_activities/:id', to: 'trip_activities#destroy'
  get '/analytics', to: 'pages#analytics', as: 'analytics'
  post '/items', to: 'items#create' 
  delete '/items/:id', to: 'items#destroy' 
  post '/packing_lists', to: 'packing_lists#create'
  post '/email_trip', to: 'trips#send_email', as: 'email_trip'

  root 'pages#home'

  resources :trips
  resources :users
  resources :sessions
  resources :destinations
  
end
