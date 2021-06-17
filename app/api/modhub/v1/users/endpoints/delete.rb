# frozen_string_literal: true

module ModHub
  module V1
    module Users
      module Endpoints
        class Delete < Grape::API
          include Auth

          resource :users do
            desc 'Deletes a user'

            delete do
              current_user.destroy!
            end
          end
        end
      end
    end
  end
end
