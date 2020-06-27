Rails.application.routes.draw do
  resources :favorites
  resources :inboxes
  resources :messages
  resources :user_events
  resources :events
  resources :donations
  resources :users
  resources :charities
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
