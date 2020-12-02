Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations'}

  root to: "pages#index"

  resources :users, only: [:index, :show]

  # get '/welcome', to:'pages#welcome'
end
