# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  fixtures :all

  let(:user) { users(:one).dup }

  describe 'validation errors' do
    it 'fails validation when name is blank' do
      user.name = ''
      user.validate
      expect(user.errors.full_messages).to include("Name can't be blank")
    end

    it 'fails validation when email is blank' do
      user.email = ''
      user.validate
      expect(user.errors.full_messages).to include("Email can't be blank")
    end

    it 'fails validation when email is not unique' do
      user.validate
      expect(user.errors.full_messages).to include('Email has already been taken')
    end
  end
end
