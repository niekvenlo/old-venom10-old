Rails.application.routes.draw do

  root to: 'static_pages#about'
  get '/about', to: 'static_pages#about', as: :about
  get '/contact', to: 'static_pages#contact', as: :contact
  get '/login_hack', to: 'static_pages#login_hack', as: :login_hack
  delete '/logout', to: 'sessions#destroy', as: :logout
  get '/auth/:provider/callback', to: 'sessions#create', as: :auth_callback

  resources :users, param: :id
  resources :groups, param: :id
  resources :sessions, param: :id, only: [:create, :destroy, :new] # :new is debug

end
