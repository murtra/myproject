Project::Application.routes.draw do

  resources :users, only: [ :show ]
  
  resource :user, only: [:edit] do
  collection do
    patch 'update_password'
    end
  end


  get "users/:id", to: "users#show" 
 

  # devise_for :users, :controllers => {:registrations => "registrations"}#, :skip => [:sessions, :registrations]
  devise_scope :user do
   root to: "devise/registrations#new"
  end

  devise_for :users, path: "", controllers: { registrations: "registrations" }, path_names: { sign_in: 'login', sign_up: 'register', sign_out: 'signout'}
  
 
 
 end

