# frozen_string_literal: true

class VehicleSerializer < ApplicationSerializer
  attribute :name, &:to_s
  attribute :year
end
