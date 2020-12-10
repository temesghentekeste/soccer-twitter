Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations'}
  
  root to: "pages#index"
  get '/home', to: 'pages#home'
  get '/discover', to: 'pages#discover'
  get '/connect', to: 'pages#connect'
  resources :opinions
  post "opinion/vote" => "votes#create"

  
  get '/home' => "pages#home", :as => :user_root
  
  resources :users, only: [:index, :show]
  get 'profile/:username', to: 'pages#profile', as: :profile
  get 'dashboard/:username', to: 'stats#index', as: :stats

  resources :followings
end
