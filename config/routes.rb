Dtebridge::Application.routes.draw do

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

  get "home/index"
  
  root to: "home#index"

  devise_for :users

end
