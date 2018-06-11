Rails.application.routes.draw do
  get 'pages/index'

  devise_for :users, controllers: {registrations: "registrations" }
  root to: "pages#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :pages do
    collection do
      get :autocomplete
    end
  end
  get 'search' => 'search#index'
  get 'collections/create' => 'collections#new'
  post 'collections/create' =>"pages#index"
end
