Rails.application.routes.draw do
  get 'movies/grouped_ratings', to: 'movies#ratings'
  resources :reviews
  resources :movies do
  resources :reviews, only: [:new, :index]
  end
  resources :genres
  devise_for :users, :controllers => {registrations: 'registrations', :omniauth_callbacks => "users/omniauth_callbacks" }


  root to: 'application#welcome'
end
