# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MakesController, type: :controller do
  fixtures :all

  describe 'GET index' do
    it 'returns a 200' do
      get :index
      expect(response).to have_http_status(:ok)
    end
  end
end
