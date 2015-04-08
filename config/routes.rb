Rails.application.routes.draw do
  devise_for :users, controllers: { 'registrations': 'registration'}
  root to: 'dashboard#index'
end
