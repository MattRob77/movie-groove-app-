Rails.application.routes.draw do
  resources :reviews
  resources :movies
  resources :genres
  devise_for :users, :controllers => {registrations: 'registrations' }

  root to: 'application#welcome'
end
