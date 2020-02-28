Rails.application.routes.draw do
  devise_for :users
  resources :cars
  get "/", to: "pages#home", as: "root"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
