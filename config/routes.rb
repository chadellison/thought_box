Rails.application.routes.draw do
  root "links#index"

  resources :links, only: [:index, :create, :update]
  get "/authentication", to: "authentication#show"

  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  resources :users, only: [:create]
end
