Rails.application.routes.draw do
  root "users#index"

  get "/users", to: "users#index"
  get "/users/:id", to: "users#get"
  put "/users/:id", to: "users#update"
  post "/users", to: "users#create"
  post "/sign_in", to: "users#sign_in"
  post "/sign_out", to: "users#sign_out"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
