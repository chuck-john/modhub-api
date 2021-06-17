# frozen_string_literal: true

module ModHub
  module V1
    module Modes
      class API < Grape::API
        resource :modes do
          desc 'Return all modes' do
            success Entities::Mode
          end

          get do
            modes = Mode.order(:name)
            present modes, with: Entities::Mode
          end
        end
      end
    end
  end
end
