# frozen_string_literal: true

Rails.application.routes.draw do
  with_options defaults: { format: :json }, only: :index do
    resources :makes
    resources :models
    resources :trims
  end

  resource :sessions, only: %i[create destroy]
end
