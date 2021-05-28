# frozen_string_literal: true

require 'rails_helper'

describe TrimsController, type: :controller do
  fixtures :all

  let(:trim) { trims(:one) }

  describe 'GET index' do
    it 'returns a 200' do
      get :index, params: { model_id: trim.model_id }
      expect(response).to have_http_status(:ok)
    end
  end
end
