Rails.application.routes.draw do

  resources :emprestimo_ferramentas
  resources :emprestimo_habilidades
  #get 'home/home'

  get 'sessions/new'

  root :to => "sessions#login"
  resources :usuarios
  get "signup", :to => "usuarios#new"
  get "users", :to => "usuarios#new"
  post "users", :to => "usuarios#create"
  get "login", :to => "sessions#login"
  post "login", :to => "sessions#login_attempt"
  get "logout", :to => "sessions#logout"
  post "logout", :to => "sessions#logout"
  get "home", :to => "home#home"
  #get "profile", :to => "sessions#profile"
  #get "setting", :to => "sessions#setting"

  resources :habilidades
  resources :categorias
  resources :ferramentas
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "cadastrar", :to => "usuarios#new"


  #get "/pages/home"
  # get "/categoria", to: "categoria#index", as: "categoria"
  # get "/habilidade", to: "habilidade#index", as: "habilidade"
end
