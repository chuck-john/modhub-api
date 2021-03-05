# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ModelsController, type: :controller do
  fixtures :all

  let(:model) { models(:one) }

  describe 'GET index' do
    it 'returns a 200' do
      get :index, params: { make_id: model.make_id }
      expect(response).to have_http_status(:ok)
    end
  end
end
