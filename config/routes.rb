Rails.application.routes.draw do

  root to: 'states#index', as: "/"

  namespace :api do
    namespace :v1 do
      resources :states, only: [:index]
    end
  end


end
