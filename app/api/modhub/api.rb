# frozen_string_literal: true

module ModHub
  class API < Grape::API
    default_format :json

    rescue_from ActiveRecord::RecordNotFound do |exception|
      error!({ errors: [exception.message] }, 404)
    end

    rescue_from ActiveRecord::RecordInvalid do |exception|
      error!({ errors: exception.record.errors.full_messages }, 422)
    end

    rescue_from :all do |exception|
      error!({ errors: [exception.message] }, 500)
    end

    mount V1::API
  end
end
