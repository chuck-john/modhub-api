# frozen_string_literal: true

module ModeDoc
  extend ActiveSupport::Concern

  included do
    include Swagger::Blocks

    swagger_schema :Mode do
      key :required, %i[id name slug]

      property :id, type: :integer, format: :int64
      property :name, type: :string
      property :slug, type: :string
    end
  end
end
