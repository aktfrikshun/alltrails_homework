Rails.application.routes.draw do
  root to: 'places#index'
  resources :places, only: %i[index create]

  namespace :api do
    namespace :v1 do
      resources :places, only: %i[index]
      resources :favorites do
        collection do
          get "toggle", to: "favorites#toggle", as: :toggle
        end
      end
    end
  end
end