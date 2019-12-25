Rails.application.routes.draw do
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
  namespace :admins do
    resources :customers
  end

    get '/customer/cancel', to: 'customers#cancel'
    get '/customers', to: 'customers#show'
    get '/customers/pass', to: 'customers#pass'
    resources :customers do
      patch :customer_status
    end
    # get '/customer/edit', to: 'customers#edit'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
