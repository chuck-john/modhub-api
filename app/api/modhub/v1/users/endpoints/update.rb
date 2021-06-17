# frozen_string_literal: true

module ModHub
  module V1
    module Users
      module Endpoints
        class Update < Grape::API
          include Auth

          resource :users do
            desc 'Updates a user' do
              success Entities::User
            end

            params do
              requires :user, type: Hash do
                optional :email, type: String
                optional :name, type: String
                optional :password, type: String
              end
            end

            put do
              current_user.update!(user_params)
            end
          end
        end
      end
    end
  end
end
