# frozen_string_literal: true

module TrimDoc
  extend ActiveSupport::Concern

  included do
    include Swagger::Blocks

    swagger_schema :Trim do
      key :required, %i[id model_id name]

      property :id, type: :integer, format: :int64
      property :model_id, type: :integer, format: :int64
      property :name, type: :string
      # property :years, type: :integer, format: :array
    end
  end
end
