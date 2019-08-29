Rails.application.routes.draw do

  root to: "emails#index"

  resources :emails

  devise_for :users

  resources :tasks, except: [:show]

end
