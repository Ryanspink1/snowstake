Rails.application.routes.draw do

  root to: 'states#index', as: "/"

  resources :states, only:[:show], param: :name do
    resources :resorts, only: [:show], param: :name
  end

  namespace :api do
    namespace :v1 do
      resources :states, only: [:index, :show]
      resources :resorts, only: [:show], param: :name
    end
  end
end
