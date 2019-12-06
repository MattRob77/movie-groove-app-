Rails.application.routes.draw do
  root to: 'application#welcome'
  
  get 'movies/grouped_ratings', to: 'movies#ratings'

  resources :reviews
  resources :movies do
  resources :reviews, only: [:new, :index]
  end
  resources :genres
  devise_for :users, path: "users", :controllers => {registrations: 'registrations', :omniauth_callbacks => "callbacks" }



end
