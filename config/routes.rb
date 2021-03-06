Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :create, :show, :update, :destroy], defaults: { format: 'json' }
      resources :sessions, only: [:create], defaults: { format: 'json' }
      resources :techs, only: [:show], defaults:{ format: 'json'}
      resources :articles, only: [:create, :show], defaults: {format: 'json'}
      get "allarticles" => "articles#getAll", defaults: { format: 'json'}
      post "validate" => "users#validate", defaults: { format: 'json' }
      get "allbrands" => "brands#getAll", defaults: { format: 'json' }
      post "gettechs" => "techs#getTechsByBrand", defaults: { format: 'json' }
      get "getalltechs" => "techs#getAllTechs", defaults: { format: 'json'}
      get "getuptoken" => "articles#getUptoken", defaults: { format: 'json' }
    end
  end
  
  root 'welcome#index'
end