# frozen_string_literal: true

module ModHub
  module V1
    module Users
      class API < Grape::API
        mount Endpoints::Create
        mount Endpoints::Delete
        mount Endpoints::Update
      end
    end
  end
end
