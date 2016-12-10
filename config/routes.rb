Rails.application.routes.draw do
  
  resources :ferramenta
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => "ferramenta#index"


  get "/pages/home"
end
