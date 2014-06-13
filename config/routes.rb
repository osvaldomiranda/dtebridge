Dtebridge::Application.routes.draw do

  get "home/index"
  root to: "home#index"

  devise_for :users
  resources :pruebas

end
