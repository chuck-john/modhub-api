# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  fixtures :all

  let(:user) { users(:one) }

  describe 'POST create' do
    it 'returns a 201' do
      post :create, params: { user: { email: user.email, password: 'password' } }
      expect(response).to have_http_status(:created)
    end
  end

  describe 'DELETE destroy' do
    it 'returns a 204' do
      user.regenerate_token
      request.headers['Authorization'] = "Bearer #{user.token}"
      delete :destroy
      expect(response).to have_http_status(:no_content)
    end

    it 'returns a 401 on invalid token' do
      request.headers['Authorization'] = "Bearer #{SecureRandom.hex}"
      delete :destroy
      expect(response).to have_http_status(:unauthorized)
    end
  end
end
