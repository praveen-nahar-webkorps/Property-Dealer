Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "homes#index"
  resources :homes

  get '/buys/apartments', to: 'buys#all_apartments'
  get '/buys/independents', to: 'buys#all_independents'
  resources :buys

  get '/rents/apartments', to: 'rents#all_apartments'
  get '/rents/independents', to: 'rents#all_independents'
  resources :rents

   
end
