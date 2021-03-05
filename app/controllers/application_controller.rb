# frozen_string_literal: true

class ApplicationController < ActionController::API
  private

  def serialize(object, serializer: serializer_class(object))
    serializer.new(object).serializable_hash
  end

  def serializer_class(object)
    "#{(object.try(:first) || object).class}Serializer".constantize
  end
end
