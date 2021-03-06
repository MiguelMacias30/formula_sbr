Rails.application.routes.draw do
  devise_for :controllers
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'products/index'
  resources :views
  get 'view/index'
  resources :appoinments
  #get 'home/index'
  devise_for :users, controllers: {
        registrations: 'users/registrations',
        omniauth_callbacks: 'users/omniauth_callbacks'
      }


  resources :products, only: :index do
    resources :orders, only: :create
  end

resources :orders, only: :index

delete 'orders/clean', to: 'orders#clean', as: 'clean_orders'
delete 'orders/:id', to: 'orders#destroy', as: 'destroy_order'

resources :billings, only:[] do
  	collection do
  		get 'pre-pay'
  		get 'execute'
  	end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
end
