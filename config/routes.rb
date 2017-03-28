Rails.application.routes.draw do

  resources :events

  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'

  resources :hobbies do
    resources :events
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


end
