Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :drone_encounters do
    collection do
      get :form, to: 'drone_encounters#form'
    end
  end
end
