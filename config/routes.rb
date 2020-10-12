Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :wines, only: [ :index, :show, :update, :create, :destroy ]
      get 'wines/name/:name', to: 'wines#search'
      get 'wines/country/:country', to: 'wines#search'
      get 'wines/region/:region', to: 'wines#search'
      get 'wines/maker/:maker', to: 'wines#search'
    end
  end
end
