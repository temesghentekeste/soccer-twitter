Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations'}
  
  root to: "pages#index"
  get '/home', to: 'pages#home'
  resources :opinions
  
  get '/home' => "pages#home", :as => :user_root
  
  resources :users, only: [:index, :show]
  get 'profile/:username', to: 'pages#profile', as: :profile

  # get '/welcome', to:'pages#welcome'
end
