Rails.application.routes.draw do
  
  devise_for :users
  resources :cars
  get 'payments/success'
  get "/", to: "pages#home", as: "root"
  get "/payments/success", to: "payments#success"
  post "/payments/webhook", to: "payments#webhook"
  # get '/search' => 'pages#search', :as => 'search_page'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
