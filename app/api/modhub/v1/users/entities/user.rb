# frozen_string_literal: true

module ModHub
  module V1
    module Users
      module Entities
        class User < Grape::Entity
          expose :email, documentation: { type: String, desc: 'User email' }
          expose :id, documentation: { type: Integer, desc: 'User ID' }
          expose :name, documentation: { type: String, desc: 'User name' }
          expose :password, documentation: { type: String, desc: 'User password' }
          expose :token, documentation: { type: String, desc: 'User token' }
        end
      end
    end
  end
end
