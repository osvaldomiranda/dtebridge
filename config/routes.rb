Dtebridge::Application.routes.draw do

  resources :detallefacturas

  resources :facturas

  get "home/index"
  root to: "home#index"

  devise_for :users
  resources :pruebas

end
