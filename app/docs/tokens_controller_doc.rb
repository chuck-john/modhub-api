# frozen_string_literal: true

module TokensControllerDoc
  extend ActiveSupport::Concern

  included do
    include Swagger::Blocks

    swagger_path '/tokens' do
      operation :post do
        key :summary, 'Create token'
        key :description, 'Create a user token'
        key :tags, ['token']

        # parameter do
        #   key :name, :email
        #   key :description, 'User email'
        #   key :type, :string
        #   key :required, true
        # end
        #
        # parameter do
        #   key :name, :password
        #   key :description, 'User password'
        #   key :type, :string
        #   key :required, true
        # end

        response 201 do
          key :description, 'Token create response'
        end
      end

      operation :delete do
        key :summary, 'Destroy token'
        key :description, 'Destroy a user token'
        key :tags, ['token']
      end
    end
  end
end
