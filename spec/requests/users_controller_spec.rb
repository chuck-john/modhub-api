# frozen_string_literal: true

require 'rails_helper'

describe UsersController, type: :controller do # rubocop:disable Metrics/BlockLength
  fixtures :all

  let(:user) { users(:one) }

  describe 'POST create' do
    it 'returns a 201' do
      post :create, params: { user: {
        email: 'test@modhub', name: 'Test', password: 'password', password_confirmation: 'password'
      } }
      expect(response).to have_http_status(:created)
    end

    it 'returns a 422 on validation errors' do
      post :create, params: { user: { email: '123', name: '' } }
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe 'PATCH update' do
    before { authorization_token(user) }

    it 'returns a 204' do
      patch :update, params: { user: { name: 'Spec' } }
      expect(response).to have_http_status(:no_content)
    end

    it 'returns a 422 on validation errors' do
      patch :update, params: { user: { name: '' } }
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe 'DELETE destroy' do
    it 'returns a 204' do
      authorization_token(user)
      delete :destroy
      expect(response).to have_http_status(:no_content)
    end
  end

  def authorization_token(user)
    user.regenerate_token
    request.headers['Authorization'] = "Bearer #{user.token}"
  end
end
