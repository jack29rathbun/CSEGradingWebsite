Rails.application.routes.draw do
  
  resources :groups
  resources :uploads
  resources :evaluations
  resources :students
  resources :password
  root :to => 'sessions#home'
  get '/admin' => 'admins#login'
  get '/admin/upload' => 'uploads#new'
  post '/admin' => 'admins#viewer'
  get '/new_evaluation' => 'evaluations#new'
  get '/evaluations' => 'evaluations#index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get 'admins/download_sample'
  get '/access_denied', to: 'sessions#access_denied'
  get '/home', to: 'sessions#home'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
