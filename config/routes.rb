Rails.application.routes.draw do
  namespace :admins do
    resources :products
  end
  resources :products, only: [:top ,:show, :index]
  devise_for :admins, controllers: {
      sessions:      'customers/sessions',
      passwords:     'customers/passwords',
      registrations: 'customers/registrations'
  }
  devise_for :customers, controllers: {
      sessions:      'customers/sessions',
      passwords:     'customers/passwords',
      registrations: 'customers/registrations'
  }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routiSZng.html
end
