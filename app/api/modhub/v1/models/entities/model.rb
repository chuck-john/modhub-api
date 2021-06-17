# frozen_string_literal: true

module ModHub
  module V1
    module Models
      module Entities
        class Model < Grape::Entity
          expose :id, documentation: { type: Integer, desc: 'Model ID' }
          expose :make_id, documentation: { type: Integer, desc: 'Model make ID' }
          expose :mode_id, documentation: { type: Integer, desc: 'Model mode ID' }
          expose :name, documentation: { type: String, desc: 'Model name' }
        end
      end
    end
  end
end
