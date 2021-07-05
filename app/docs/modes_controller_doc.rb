# frozen_string_literal: true

module ModesControllerDoc
  extend ActiveSupport::Concern

  included do
    include Swagger::Blocks

    swagger_path '/modes' do
      operation :get do
        key :summary, 'All Modes'
        key :description, 'Returns all modes in the database'
        key :tags, ['mode']

        response 200 do
          key :description, 'mode response'

          schema do
            key :type, :array
            items { key :$ref, :Mode }
          end
        end
      end
    end
  end
end
