# frozen_string_literal: true

module ModHub
  module V1
    module Tokens
      module Entities
        class CreateParams < Grape::Entity
          expose :email,
                 documentation: { desc: 'User email', type: String, required: true }
          expose :password,
                 documentation: { desc: 'User password', type: String, required: true }
        end
      end
    end
  end
end
