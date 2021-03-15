# frozen_string_literal: true

Rails.application.routes.draw do
  with_options defaults: { format: :json }, only: :index do
    resources :kinds
    resources :makes
    resources :models
    resources :trims
  end

  resource :sessions, only: %i[create destroy]
  resource :users, only: %i[create update destroy]
end
