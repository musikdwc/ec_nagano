Rails.application.routes.draw do

  resources :products, only: [:top ,:show, :index]
  devise_for :admins, controllers: {
      sessions:      'admins/sessions',
      passwords:     'admins/passwords',
      registrations: 'admins/registrations'
  }
  devise_for :customers, controllers: {
      sessions:      'customers/sessions',
      passwords:     'customers/passwords',
      registrations: 'customers/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routiSZng.html

  namespace :admins do
   resources :customers
   resources :products
   resources :genres, only: [:index ,:create, :edit, :update]

  end
  namespace :customers do
    resources :carts, only: [:index ,:create, :update, :destroy]
    delete '/all_carts_destroy', to: "carts#all_destroy", as: "all_destroy"
  end

  resources :products

    get '/customer/cancel', to: 'customers#cancel'
    get '/customers', to: 'customers#show'
    get '/customers/pass', to: 'customers#pass'
    resources :customers do
      patch :customer_status
      resources :deliveries, only:[:index, :edit, :update, :destroy, :new, :create]
  end

end