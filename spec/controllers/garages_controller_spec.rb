# frozen_string_literal: true

require 'rails_helper'

describe GaragesController, type: :controller do
  fixtures :all

  let(:garage) { garages(:one) }
  let(:user) { garage.user }

  before do
    user.regenerate_token
    request.headers['Authorization'] = "Bearer #{user.token}"
  end

  describe 'POST create' do
    it 'returns a 201' do
      post :create, params: { garage: { location: 'home', name: 'main' } }
      expect(response).to have_http_status(:created)
    end
  end

  describe 'DELETE destroy' do
    it 'returns a 204' do
      delete :destroy, params: { id: garage.id }
      expect(response).to have_http_status(:no_content)
    end
  end
end
