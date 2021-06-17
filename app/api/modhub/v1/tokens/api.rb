# frozen_string_literal: true

module ModHub
  module V1
    module Tokens
      class API < Grape::API
        mount Endpoints::Create
        mount Endpoints::Delete
      end
    end
  end
end
