Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :wines, only: [ :index, :show ]
      get 'search/:query', to: 'wines#search'
    end
  end
end
