Dtebridge::Application.routes.draw do

get '/get_siitoken', to: 'connectsii#get_token'

  resources :debitnotedetails
  resources :debitnotes
  resources :creditnotedetails
  resources :creditnotes
  resources :invoicedetails
  resources :invoices
  resources :guidedetails
  resources :guides
  resources :pruebas
  devise_for :users
end
