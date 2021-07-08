# frozen_string_literal: true

Rails.application.routes.draw do
  with_options defaults: { format: :json } do
    with_options only: :index do
      resources :makes
      resources :models
      resources :modes
      resources :trims
    end

    with_options only: %i[create destroy] do
      resource :tokens

      resources :garages
      resources :vehicles
    end

    resource :users, only: %i[create update destroy]
  end
end
