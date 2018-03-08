Rails.application.routes.draw do
  resources :attendees
  resources :study_sessions
  resources :admin
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'users/registrations' }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  resources :users, only: [:show] do
    resources :study_sessions, only: [:show, :index]
    resources :attendees, only: [:index, :show]
  end

#  get '/users/:user_id/study_sessions_by_grade', to: 'study_sessions#by_grade', as: 'study_sessions_by_grade'
end
