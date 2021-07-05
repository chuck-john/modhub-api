# frozen_string_literal: true

module MakeDoc
  extend ActiveSupport::Concern

  included do
    include Swagger::Blocks

    swagger_schema :Make do
      key :required, %i[id name]

      property :id, type: :integer, format: :int64
      property :name, type: :string
    end
  end
end
