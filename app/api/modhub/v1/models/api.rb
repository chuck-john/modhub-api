# frozen_string_literal: true

module ModHub
  module V1
    module Models
      class API < Grape::API
        resource :models do
          desc 'Return all models for a given make' do
            success Entities::Model
          end

          params do
            requires :make_id, type: Integer, desc: 'Filters models by make'
          end

          get do
            models = Model.where(make_id: params[:make_id]).order(:name)
            present models, with: Entities::Model
          end
        end
      end
    end
  end
end
