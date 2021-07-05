# frozen_string_literal: true

module ModelsControllerDoc
  extend ActiveSupport::Concern

  included do
    include Swagger::Blocks

    swagger_path '/models' do
      operation :get do
        key :summary, 'All Models'
        key :description, 'Returns all models for a given make'
        key :tags, ['model']

        parameter do
          key :name, :make_id
          key :description, 'ID of make to filter by'
          key :required, true
        end

        response 200 do
          key :description, 'model response'

          schema do
            key :type, :array
            items { key :$ref, :Model }
          end
        end
      end
    end
  end
end
