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

  # routes with resources
  resources :hobbies do
    resources :events, only: [:index, :new, :create, :edit, :update, :destroy] do
      resources :bookings, only: [:create, :update, :destroy]
    end
  end
  resources :users, only:[:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get('/dashboard_host', {to: 'pages#dashboard_host'})

  get '/dashboard_guest', to: 'pages#dashboard_guest'

end



