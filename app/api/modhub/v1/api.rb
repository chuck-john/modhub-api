# frozen_string_literal: true

module ModHub
  module V1
    class API < Grape::API
      version :v1, using: :accept_version_header

      mount Makes::API
      mount Models::API
      mount Modes::API
      mount Tokens::API
      mount Trims::API
      mount Users::API

      add_swagger_documentation \
        doc_version: 'v1',
        mount_path: '/swagger',
        info: {
          title: 'ModHub API Docs',
          description: 'ModHub API Documentation'
        }
    end
  end
end
