# frozen_string_literal: true

class ApplicationController < ActionController::API
  private

  def create_action?
    action_name == 'create'
  end

  def render_json(object, status = :ok)
    render(json: serializable?(object) ? serialize(object) : object, status: status)
  end

  def serializable?(object)
    serializer_class(object)
  rescue NameError
    false
  end

  def serialize(object)
    serializer_class(object).new(object).serializable_hash
  end

  def serializer_class(object)
    "#{object.try(:klass) || object.class}Serializer".constantize
  end
end
