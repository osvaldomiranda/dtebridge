Dtebridge::Application.routes.draw do

<<<<<<< HEAD
 /  get "dtelist", to: "dtelist#index" /

  resources :debitnotedetails
=======
get '/get_siitoken', to: 'connectsii#get_token'
>>>>>>> 8ce160a81dbae0b95a3ab3f67e5af75ba174da1d

  resources :debitnotedetails
  resources :debitnotes
  resources :creditnotedetails
  resources :creditnotes
  resources :invoicedetails
  resources :invoices
  resources :guidedetails
  resources :guides
<<<<<<< HEAD

  resources :pruebas

  get "home/index"
  
  root to: "home#index"

  devise_for :users


=======
  resources :pruebas
  devise_for :users
>>>>>>> 8ce160a81dbae0b95a3ab3f67e5af75ba174da1d
end
