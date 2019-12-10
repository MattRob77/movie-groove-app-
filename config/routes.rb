Rails.application.routes.draw do
  root to: 'application#welcome'

  get 'movies/grouped_ratings', to: 'movies#ratings'

  resources :reviews
  resources :movies
  resources :reviews, only: [:new, :index]
  
  resources :genres
  devise_for :users, path: "users", :controllers => {registrations: 'registrations', :omniauth_callbacks => "callbacks" }
  #devise only handles users



end
