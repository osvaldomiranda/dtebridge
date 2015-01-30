Dtebridge::Application.routes.draw do

  get "detlibrovta/index"
  get "uploadformat/index"
  get "libro_compra/index"
  resources :compmanuals do
    collection { post :import }
  end

  resources :docmanuals do
    collection { post :import }
  end

  resources :otrosimpmanuals
  resources :otrosimpcompmanuals

  resources :sucursals
  resources :empresas
  resources :subdsctos
  resources :cdgitems
  resources :comisioncompras
  resources :refdetcompras
  resources :dscrcgglobalcompras
  resources :imptoretencompras
  resources :mpagocompras
  resources :docsemails
  resources :doccompras
  resources :comisions
  resources :ref_detalles
  resources :dsc_rcg_globals
  resources :impuesto_retens
  resources :monto_pagos
  resources :detalles
  resources :documentos
  resources :iat_logs
  resources :iats

  get "estadistica/index"
  devise_for :installs


  devise_for :users

  get "home/index"
  get "libro_venta/index"
  post "buscarLibrovta", to: "libro_venta#find"
  get "doccompras_aprob/index"
  get "doccompras_rech/index"
  get "get_siitoken", to: "connectsii#get_token"
  get "postsii" , to: "connectsii#postsii"
  get "setDTE" , to: "connectsii#createenvio"
  get "respIntercam" , to: "connectsii#resp_intercambio"
  get "recepMercaderia" , to: "connectsii#recep_mercaderia"
  get "aprobComercial" , to: "connectsii#aprob_comercial"
  get "estadistica", to: "estadistica#index"
  get "detcompras/:id", to: "detcompras#index"
  
  get "doccompras/rechazar/:id", to: "doccompras#rechazar"
  get "doccompras/aprobar/:id", to: "doccompras#aprobar"
  get "doccompras_aprob/rechazar/:id", to: "doccompras_aprob#rechazar"
  get "doccompras_rech/aprobar/:id", to: "doccompras_rech#aprobar"
  get "doccompras_aprob", to: "doccompras_aprob#index"
  get "doccompras_rech", to: "doccompras_rech#index"
  post "buscarDoc", to: "documentos#find"

  root to: "home#index"

  namespace :api do
    namespace :v1 do
      post "/pruebas", to: "pruebas#create"
      post "/iat_doc", to: "iat#iat_doc"
      post "/invoice", to: "documento#create_doc"
      get  "/pruebas", to: "pruebas#index"
      get "/iat_login", to: "iat#login"
      get "/iat_ping/:id", to: "iat#ping"
      get "/gettoken", to: "documento#get_token"
      get "/procestado", to: "documento#procesoEstado"
      get "/notification", to: "notification#send_notif"
      get "/procesarecibo", to: "doccompra#procesarecibo"
      get "/resend", to: "documento#resend"
     end
  end

end
