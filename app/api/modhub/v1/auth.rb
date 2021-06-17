# frozen_string_literal: true

module ModHub
  module V1
    module Auth
      extend ActiveSupport::Concern

      included do
        helpers do
          def authorization_token
            header = request.headers['Authorization']
            header.split[1].presence if header
          end

          def authorize!
            error!('Unauthorized', 401) unless current_user.valid_jwt?(authorization_token)
          end

          def current_user
            @current_user ||= User.find_by(token: authorization_token)
          end
        end
      end
    end
  end
end
