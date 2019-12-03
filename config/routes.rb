Rails.application.routes.draw do
  resources :reviews
  resources :movies do
    resources :reviews, [only: :new, :index]
  end 
  resources :genres
  devise_for :users, :controllers => {registrations: 'registrations' }

  root to: 'application#welcome'
end
