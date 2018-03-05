Rails.application.routes.draw do
  resources :attendees
  resources :study_sessions
  resources :admin
  devise_for :users, :controllers => {registrations: 'registrations'}

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  resources :users, only: [:show] do
    resources :study_sessions, only: [:show, :index]
  end
end
