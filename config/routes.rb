Rails.application.routes.draw do
  get 'products/index'
  resources :views
  get 'view/index'
  resources :appoinments
  #get 'home/index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
end
