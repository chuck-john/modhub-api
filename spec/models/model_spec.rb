# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Model, type: :model do
  fixtures :all

  let(:model) { models(:one).dup }

  describe 'validation errors' do
    it 'fails validation when name is blank' do
      model.name = ''
      model.validate
      expect(model.errors.full_messages).to include("Name can't be blank")
    end

    it 'fails validation when name is not unique' do
      model.validate
      expect(model.errors.full_messages).to include('Name has already been taken')
    end
  end
end
