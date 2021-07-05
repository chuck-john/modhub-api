# frozen_string_literal: true

module RootDoc
  extend ActiveSupport::Concern

  TAGS = %w[garage make mode model token trim user vehicle].freeze

  included do
    include Swagger::Blocks

    swagger_root do
      key :swagger, '2.0'

      info do
        key :version, '1.0.0'
        key :title, 'ModHub'
        key :description, 'ModHub API documentation'
        key :termsOfService, 'https://example.com'
        contact { key :name, 'ModHub API Team' }
        license { key :name, 'ModHub' }
      end

      key :host, 'localhost:3000'
      key :basePath, '/'
      key :consumes, ['application/json']
      key :produces, ['application/json']

      TAGS.each { |t| tag name: t, description: "#{t.titleize} operations" }
    end
  end
end
