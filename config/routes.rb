Rails.application.routes.draw do
  get 'products/index'
  resources :views
  get 'view/index'
  resources :appoinments
  #get 'home/index'
  devise_for :users

  resources :products, only: :index do
    resources :orders, only: :create
  end

resources :orders, only: :index

delete 'orders/clean', to: 'orders#clean', as: 'clean_orders'
delete 'orders/:id', to: 'orders#destroy', as: 'destroy_order'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
end
