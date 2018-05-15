Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'welcome/index'
  
  resources :clubs

  root 'welcome#index'

  namespace :api do
    namespace :v1 do
      resources :clubs
      resources :seasons do
        resources :matches
        resources :standings, only: [:index]
      end
    end
  end
end
