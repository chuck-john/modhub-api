# frozen_string_literal: true

module ModHub
  module V1
    module Modes
      module Entities
        class Mode < Grape::Entity
          expose :id, documentation: { type: Integer, desc: 'Mode ID' }
          expose :name, documentation: { type: String, desc: 'Mode name' }
          expose :slug, documentation: { type: String, desc: 'Mode slug' }
        end
      end
    end
  end
end
