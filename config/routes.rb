Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :words, only: [ :index, :new, :create, :update]
      resources :images, only: [ :index, :new, :create, :update]
    end
  end

end
