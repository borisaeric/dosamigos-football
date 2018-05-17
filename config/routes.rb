Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'welcome/index'

  match '/404', to: 'errors#not_found', via: :all
  match '/500', to: 'errors#internal_server_error', via: :all
  
  resources :clubs
  resources :seasons do
    resources :matches
    resources :standings, only: [:index]
  end

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

  get '*unmatched_route', to: 'errors#not_found', via: :all
end
