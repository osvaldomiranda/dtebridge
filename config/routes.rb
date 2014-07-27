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

end
