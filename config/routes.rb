Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :films, defaults: {format: :json}, only: [:index, :show]
      resources :ratings, defaults: {format: :json}, only: [:create, :update, :destroy]
    end
  end
end
