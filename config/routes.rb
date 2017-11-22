Rails.application.routes.draw do

  root to: 'states#index', as: "/"

  resources :states, param: :name

  namespace :api do
    namespace :v1 do
      resources :states, only: [:index, :show]
    end
  end


end
