Dtebridge::Application.routes.draw do

  resources :comisions

  resources :ref_detalles

  resources :dsc_rcg_globals

  resources :impuesto_retens

  resources :monto_pagos

  resources :detalles

  resources :documentos

  resources :iat_logs

  resources :iats

  get "home/index"
  get "get_siitoken", to: "connectsii#get_token"
  get "postsii" , to: "connectsii#postsii"
  get "setDTE" , to: "connectsii#createenvio"
  get "respIntercam" , to: "connectsii#resp_intercambio"
  get "recepMercaderia" , to: "connectsii#recep_mercaderia"
  get "aprobComercial" , to: "connectsii#aprob_comercial"
  
  root to: "home#index"

  
  devise_for :users

  namespace :api do
    namespace :v1 do
      post '/pruebas', to: "pruebas#create"
      get '/pruebas', to: "pruebas#index"

      get "/iat_login", to: "iat#login"
      get "/iat_ping/:id", to: "iat#ping"

      post "/iat_doc", to: "iat#iat_doc"
      post "/invoice", to: "documento#create_doc"
     end
  end

end
