Rails.application.routes.draw do
  devise_for :users, controllers: { 'registrations': 'registration'}
  root to: 'dashboard#index'

  resources :invoices, only: [:index, :edit]
  resources :expenses, only: [:create, :update, :destroy]
end
