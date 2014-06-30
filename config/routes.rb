Dtebridge::Application.routes.draw do

 /  get "dtelist", to: "dtelist#index" /

  resources :debitnotedetails

  resources :debitnotes

  resources :creditnotedetails

  resources :creditnotes

  resources :invoicedetails

  resources :invoices

  resources :guidedetails

  resources :guides

  resources :pruebas

  get "home/index"
  
  root to: "home#index"

  devise_for :users


end
