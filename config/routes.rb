Rails.application.routes.draw do
  # auth
  post 'users/sign_up', to: 'sessions#sign_up'
  post 'users/sign_in', to: 'sessions#sign_in'
  delete 'users/sign_out', to: 'sessions#sign_out'
  get 'users/me', to: 'sessions#me'
  devise_for :users


  resources :clients
  resources :addresses
  resources :sub_districts
  resources :districts
  resources :provinces
  resources :genders
  resources :shirt_sizes
  resources :races

  post 'addresses/creates', to: 'addresses#creates'

end
