Rails.application.routes.draw do

  mount RailsAdmin::Engine, at: '/admin', as: 'rails_admin'
  mount Refinery::Core::Engine, at: '/admin/cms'
  match '(:anything)' => 'application#nothing', via: [:options]

  devise_for :users, only: :omniauth_callbacks, controllers: { omniauth_callbacks: 'omniauth_callbacks' }
  scope "(:locale)", :locale => /en|ar/ do

    get 'pages/index'
    devise_for :users, skip: :omniauth_callbacks, controllers: {registrations: "registrations",
  sessions: "sessions" }
    get '/users/:id', :to => 'users#show'

    resources :user_providers, only: [:new, :create]
    # root to: "pages#index"
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

    resources :content_partners do
      resources :resources, :controller => 'content_partners/resources'
    end

    match '/404', to: 'errors#not_found', via: :all
    match '/500', to: 'errors#internal_server_error', via: :all

    devise_scope :user do
      get '/omniauth' => 'omniauth_callbacks#twitter_add_data', :as =>"omniauth"
    # delete '/sign_out', controller: "sessions", action: "destroy"
    end

    #media
    resources :media, only: [:show]
    resources :users, only: [:show]
    resources :articles, only: [:show]
    root 'home_page#index'
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
      get "articles"
      get "maps"

      member do
        get 'names'
      end

    end

    resources :data, only: [:show]

    resources :collections do
      get "/collections/:id(.:format)" => 'collections#show'
      get "logs"
      post '/collections/:id/edit(.:format)' => 'collections#edit'
      resources :collected_pages, only: [:index]
      post 'add_user'
      post 'remove_user'
      get '/collected_pages/autocomplete' => 'collected_pages#autocomplete'
    end
    resources :collected_pages do
      delete '/collected_pages/:id'=>'collected_pages#destroy'

    end
    #tabs

    get :media_grid, :controller => :pages
    get :data_grid, :controller => :pages
    get :vernaculars_tab, :controller => :pages
    get :classification_tab, :controller => :pages
    get :scientific_names_tab, :controller => :pages
    get :literature_and_references_tab, :controller => :pages
    get :articles_tab, :controller => :pages

    #search
    get 'search' => 'search#index'

    get 'overview', :to => redirect("/pages/%{page_id}", :status => 301)

    #External API
    get "api/docs/:action" => "api/docs"
    get "api/:action" => "api"
    get "api/docs/:action/:version" => "api/docs", :constraints => {version:  /\d\.\d/}
    match "api/:action/:version" => "api", :constraints => {version:  /\d\.\d/}, via: [:get, :post]
    match 'api/:action/:version/:id' => 'api', :constraints => {version:  /\d\.\d/}, via: [:get, :post]

    #harvesterUI
    get '/resources/index' => 'content_partners/resources#index'
    get '/resources/:id/info', :to => 'content_partners/resources#info'
    
  end
end
