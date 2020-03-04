Rails.application.routes.draw do
  get 'payments/success'
  devise_for :users
  resources :cars
  get "/", to: "pages#home", as: "root"
  get "/payments/success", to: "payments#success"
  # get '/search' => 'pages#search', :as => 'search_page'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
