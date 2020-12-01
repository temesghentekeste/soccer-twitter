Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations'}

  root to: "home#index"

  resources :users, only: [:index, :show]
end
