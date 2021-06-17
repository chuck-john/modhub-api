# frozen_string_literal: true

module ModHub
  module V1
    module Trims
      module Entities
        class Trim < Grape::Entity
          expose :id, documentation: { type: Integer, desc: 'Trim ID' }
          expose :model_id, documentation: { type: Integer, desc: 'Trim model ID' }
          expose :name, documentation: { type: String, desc: 'Trim name' }
          expose :years, documentation: { type: Integer, desc: 'Trim years' }
        end
      end
    end
  end
end
