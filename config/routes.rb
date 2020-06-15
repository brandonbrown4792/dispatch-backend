Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :update, :destroy]
      resources :messages, only: [:index, :show, :create, :update, :destroy]
      resources :appointments, only: [:index, :show, :create, :update, :destroy]
      resources :notes, only: [:index, :show, :create, :update, :destroy]
      resources :dispatcher_nurses, only: [:index, :create, :destroy]
      resources :dispatcher_patients, only: [:index, :create, :destroy]

      post '/login', to: 'sessions#create'
      post '/signup', to: 'users#create'
      post '/get-info', to: 'users#get_info'
    end
  end
end
