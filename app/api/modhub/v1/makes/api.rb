# frozen_string_literal: true

module ModHub
  module V1
    module Makes
      class API < Grape::API
        resource :makes do
          desc 'Return all makes' do
            success Entities::Make
          end

          get do
            makes = Make.order(:name)
            present makes, with: Entities::Make
          end
        end
      end
    end
  end
end
