Rails.application.routes.draw do
  
  get '/about', to: 'static_pages#about', as: :about
  get '/contact', to: 'static_pages#contact', as: :contact
  get '/login_hack', to: 'static_pages#login_hack', as: :login_hack

  resources :users, param: :id
  resources :groups, param: :id

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
