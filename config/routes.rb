Rails.application.routes.draw do
      root to: "products#top"
   get '/about',to: 'products#about'
  
  get '/search/genre', to: 'products#search_genre'
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
    resources :orders, only: [:index,:show,:update]
    get '/top', to: "orders#top"
    resources :customers
    resources :products
    resources :genres, only: [:index ,:create, :edit, :update]
    get 'product/top',to: "products#top"

  end
  namespace :customers do
    get '/thanks', to: 'orders#thanks'
    resources :carts, only: [:index ,:create, :update, :destroy]
    delete '/all_carts_destroy', to: "carts#all_destroy", as: "all_destroy"
    resources :orders, only: [:new, :create, :index, :show] do
      collection do
        post :new,path: :new, as: :new
        post :about
      end
    end
  end
  resources :products

    get '/customer/cancel', to: 'customers#cancel'
    get '/customers', to: 'customers#show'
    get '/customers/pass', to: 'customers#pass'
    resources :customers do
      patch :customer_status
      resources :deliveries, only:[:index, :edit, :update, :destroy, :new, :create]
  end
  devise_scope :customer do
    get '/customers/sign_out' => 'devise/sessions#destroy'
  end

end