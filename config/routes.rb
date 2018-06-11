Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :content_partners do
    resources :resources, :controller => 'content_partners/resources'
  end
  
end
