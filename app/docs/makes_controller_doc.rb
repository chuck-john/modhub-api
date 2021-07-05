# frozen_string_literal: true

module MakesControllerDoc
  extend ActiveSupport::Concern

  included do
    include Swagger::Blocks

    swagger_path '/makes' do
      operation :get do
        key :summary, 'All Makes'
        key :description, 'Returns all makes in the database'
        key :tags, ['make']

        response 200 do
          key :description, 'make response'

          schema do
            key :type, :array
            items { key :$ref, :Make }
          end
        end
      end
    end
  end
end
