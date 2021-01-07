Rails.application.routes.draw do
  root "users#index"

  get "/users", to: "users#index"
  get "/users/:id", to: "users#get"
  put "/users/:id", to: "users#update"
  post "/users", to: "users#create"

  post "/sign_in", to: "auth#sign_in"
  post "/sign_out", to: "auth#sign_out"

end
