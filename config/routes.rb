Rails.application.routes.draw do
  
  resources :users, param: :id
  resources :groups, param: :id

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
