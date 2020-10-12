Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :wines, only: [ :index, :show, :update, :create, :destroy ], :path => "vinhos"
      get 'vinhos/nome/:name', to: 'wines#search'
      get 'vinhos/origem/:origin', to: 'wines#search'
      get 'vinhos/regiao/:region', to: 'wines#search'
      get 'vinhos/enologo/:maker', to: 'wines#search'
    end
  end
end
