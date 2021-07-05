# frozen_string_literal: true

module ModelDoc
  extend ActiveSupport::Concern

  included do
    include Swagger::Blocks

    swagger_schema :Model do
      key :required, %i[id make_id name]

      property :id, type: :integer, format: :int64
      property :make_id, type: :integer, format: :int64
      property :name, type: :string
    end
  end
end
