# frozen_string_literal: true

module TrimsControllerDoc
  extend ActiveSupport::Concern

  included do
    include Swagger::Blocks

    swagger_path '/trims' do
      operation :get do
        key :summary, 'All Trims'
        key :description, 'Returns all trims for a given model'
        key :tags, ['trim']

        parameter do
          key :name, :model_id
          key :description, 'ID of model to filter by'
          key :required, true
        end

        response 200 do
          key :description, 'trim response'

          schema do
            key :type, :array
            items { key :$ref, :Trim }
          end
        end
      end
    end
  end
end
