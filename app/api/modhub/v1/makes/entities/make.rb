# frozen_string_literal: true

module ModHub
  module V1
    module Makes
      module Entities
        class Make < Grape::Entity
          expose :id, documentation: { type: Integer, desc: 'Make ID' }
          expose :name, documentation: { type: String, desc: 'Make name' }
        end
      end
    end
  end
end
