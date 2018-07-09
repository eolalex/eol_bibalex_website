Rails.application.routes.draw do
  
  get 'pages/index'

  devise_for :users, controllers: {registrations: "registrations",
    omniauth_callbacks: "omniauth_callbacks" }
  # root to: "pages#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :content_partners do
    resources :resources, :controller => 'content_partners/resources'
  end
  
  resources :pages do
  # for autocomplete in search
    collection do
      get :autocomplete
      get 'overview', :to => redirect('collections#new', :status => 301)
    end
    get "media"
    get "overview", :to => redirect("/pages/%{page_id}")
    get "literature_and_references"
    get "data"

    member do
      get 'names'
    end

  end
  
  # resources :data, only: [:show]

  resources :collections do
    get "logs"
    post '/collections/:id/edit(.:format)' => 'collections#edit'
    resources :collected_pages, only: [:index]
    post 'add_user'
    post 'remove_user'
  end
  resources :collected_pages
  delete '/collected_pages/:id'=>'collected_pages#destroy'

  #search
  get 'search' => 'search#index'

  get 'overview', :to => redirect("/pages/%{page_id}", :status => 301)

  #External API
  get "api/docs/:action" => "api/docs"
  get "api/:action" => "api"
  get "api/docs/:action/:version" => "api/docs", :constraints => {version:  /\d\.\d/}
  match "api/:action/:version" => "api", :constraints => {version:  /\d\.\d/}, via: [:get, :post]
  match 'api/:action/:version/:id' => 'api', :constraints => {version:  /\d\.\d/}, via: [:get, :post]

  match '/404', :to => 'errors#not_found', :via => :all
  match '/500', :to => 'errors#internal_server_error', :via => :all

  
  #media
  resources :media, only: [:show]
  
  root 'home_page#index'
  # get 'media' => 'media#show'
  
  
  # This line mounts Refinery's routes at the root of your application.
  # This means, any requests to the root URL of your application will go to Refinery::PagesController#home.
  # If you would like to change where this extension is mounted, simply change the
  # configuration option `mounted_path` to something different in config/initializers/refinery/core.rb
  #
  # We ask that you don't use the :as option here, as Refinery relies on it being the default of "refinery"
  mount Refinery::Core::Engine, at: Refinery::Core.mounted_path
end
