# frozen_string_literal: true

module ModHub
  module V1
    module Tokens
      module Endpoints
        class Delete < Grape::API
          include Auth

          resource :tokens do
            desc 'Deletes a token'

            delete do
              current_user.update!(token: nil)
            end
          end
        end
      end
    end
  end
end
