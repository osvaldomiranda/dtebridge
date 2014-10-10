Dtebridge::Application.routes.draw do

  resources :iat_logs

  resources :iats

  get "home/index"
  get "get_siitoken", to: "connectsii#get_token"
  get "postsii" , to: "connectsii#postsii"
  
  root to: "home#index"


  resources :debitnotedetails
  resources :debitnotes
  resources :creditnotedetails
  resources :creditnotes
  resources :invoicedetails
  resources :invoices
  resources :guidedetails
  resources :guides
  resources :pruebas
  resources :connectsii

  devise_for :users

  namespace :api do
    namespace :v1 do
      post '/pruebas', to: "pruebas#create"
      get '/pruebas', to: "pruebas#index"

      get "/iat_login", to: "iat#login"
      get "/iat_ping/:id", to: "iat#ping"

      post "/iat_doc", to: "iat#iat_doc"
     end
  end

end
