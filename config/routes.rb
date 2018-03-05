Rails.application.routes.draw do
  resources :attendees
  resources :study_sessions
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
end
