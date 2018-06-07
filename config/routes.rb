Rails.application.routes.draw do
  get 'pages/index'

  devise_for :users, controllers: {registrations: "registrations" }
  root to: "pages#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :pages do
    # for autocomplete in search
    collection do
      get :autocomplete
    end
  end
  
  #search
  get 'search' => 'search#index'
  
  #External API
  get "api/docs/:action" => "api/docs"
  get "api/:action" => "api"
  get "api/docs/:action/:version" => "api/docs", :constraints => {version:  /\d\.\d/}
  match "api/:action/:version" => "api", :constraints => {version:  /\d\.\d/}, via: [:get, :post]
  match 'api/:action/:version/:id' => 'api', :constraints => {version:  /\d\.\d/}, via: [:get, :post]
end
