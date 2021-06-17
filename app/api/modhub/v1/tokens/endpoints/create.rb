# frozen_string_literal: true

module ModHub
  module V1
    module Tokens
      module Endpoints
        class Create < Grape::API
          helpers do
            def authorize!
              return if current_user.valid_password?(params[:password])

              error!('Unauthorized', 401)
            end

            def current_user
              @current_user ||= User.find_by!(email: params[:email])
            end
          end

          resource :tokens do
            desc 'Creates a new token' do
              # params Entities::CreateParams.documentation
              success Entities::User
              body_name :user
            end

            params do
              requires :email, type: String, desc: 'User email'
              requires :password, type: String, desc: 'User password'
            end

            post do
              authorize!
              current_user.regenerate_token
              present current_user, with: Entities::User
            end
          end
        end
      end
    end
  end
end
