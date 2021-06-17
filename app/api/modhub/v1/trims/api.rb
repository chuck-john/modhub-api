# frozen_string_literal: true

module ModHub
  module V1
    module Trims
      class API < Grape::API
        resource :trims do
          desc 'Return all trims for a given model' do
            success Entities::Trim
          end

          params do
            requires :model_id, type: Integer, desc: 'Filters trims by model'
          end

          get do
            trims = Trim.where(model_id: params[:model_id]).order(:name)
            present trims, with: Entities::Trim
          end
        end
      end
    end
  end
end
