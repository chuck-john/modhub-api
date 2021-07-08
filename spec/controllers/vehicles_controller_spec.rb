# frozen_string_literal: true

require 'rails_helper'

describe VehiclesController, type: :controller do
  fixtures :all

  let(:vehicle) { vehicles(:one) }
  let(:user) { vehicle.user }
  let(:garage) { user.garages.first }
  let(:trim) { trims(:two) }
  let(:year) { trim.years.sample }

  before do
    user.regenerate_token
    request.headers['Authorization'] = "Bearer #{user.token}"
  end

  describe 'POST create' do
    it 'returns a 201' do
      post :create, params: { vehicle: { garage_id: garage.id, trim_id: trim.id, year: year } }
      expect(response).to have_http_status(:created)
    end
  end

  describe 'DELETE destroy' do
    it 'returns a 204' do
      delete :destroy, params: { id: vehicle.id }
      expect(response).to have_http_status(:no_content)
    end
  end
end
