# frozen_string_literal: true

Rails.application.routes.draw do
  with_options defaults: { format: :json } do
    with_options only: :index do
      resources :docs
      resources :makes
      resources :models
      resources :modes
      resources :trims
    end

    resource :tokens, only: %i[create destroy]
    resource :users, only: %i[create update destroy]
  end
end
