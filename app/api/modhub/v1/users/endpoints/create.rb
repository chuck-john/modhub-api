# frozen_string_literal: true

module ModHub
  module V1
    module Users
      module Endpoints
        class Create < Grape::API
          helpers do
            def current_user
              attributes = user_params.merge(password_confirmation: params[:password])
              @current_user = User.create!(attributes: attributes)
            end
          end

          resource :users do
            desc 'Creates a new user' do
              success Entities::User
            end

            params do
              requires :user, type: Hash do
                requires :email, type: String
                requires :name, type: String
                requires :password, type: String
              end
            end

            post do
              present current_user, with: Entities::User
            end
          end
        end
      end
    end
  end
end
