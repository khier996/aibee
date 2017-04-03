Rails.application.routes.draw do
  get 'users/show'

  get 'users/edit'

  # root route
  root to: 'pages#home'

  # libraries
  mount Attachinary::Engine => "/attachinary"

  devise_for :users,
    controllers: { registrations: "registrations",
      omniauth_callbacks: 'users/omniauth_callbacks'
    }

  resources :categories, only: [:show] do
    resources :hobbies, only: [:index]
  end

  # routes with resources
  resources :hobbies do
    patch '/like', to: 'hobbies#like'
    resources :events do
      resources :bookings, only: [:create, :update, :destroy]
    end
  end

  resources :users, only:[:show, :update, :edit]
  resource :profile, only: [:show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get('/dashboard_host', {to: 'pages#dashboard_host'})

  get '/dashboard_guest', to: 'pages#dashboard_guest'



end






