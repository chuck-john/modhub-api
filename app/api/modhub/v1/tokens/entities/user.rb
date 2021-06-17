# frozen_string_literal: true

module ModHub
  module V1
    module Tokens
      module Entities
        class User < Grape::Entity
          expose :token, documentation: { type: String, desc: 'User token' }
        end
      end
    end
  end
end
