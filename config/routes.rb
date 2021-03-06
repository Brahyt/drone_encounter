Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "drone_encounters#index"

  resources :drone_encounters do
    collection do
      get :form, to: 'drone_encounters#form'
      get :reset, to: 'drone_encounters#reset'
    end
  end

  resources :teams, only: %i[new create]
  resources :players, only: %i[new create update]
end
