Dtebridge::Application.routes.draw do

  get "home/index"
  get "get_siitoken", to: "connectsii#get_token"
  
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
     end
  end

end
