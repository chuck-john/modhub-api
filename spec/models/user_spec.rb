# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do # rubocop:disable Metrics/BlockLength
  fixtures :all

  describe 'validation errors' do
    let(:user) { users(:one).dup }

    it 'fails on blank name' do
      user.name = ''
      user.validate
      expect(user.errors.full_messages).to include("Name can't be blank")
    end

    it 'fails on blank email' do
      user.email = ''
      user.validate
      expect(user.errors.full_messages).to include("Email can't be blank")
    end

    it 'fails on non-unique email' do
      user.validate
      expect(user.errors.full_messages).to include('Email has already been taken')
    end

    it 'fails on invalid email' do
      user.email = '123'
      user.validate
      expect(user.errors.full_messages).to include('Email is invalid')
    end
  end

  describe 'instance methods' do
    let(:user) { users(:one) }

    describe 'JWT' do
      it 'returns true on valid JWT' do
        user.regenerate_token
        expect(user).to be_valid_jwt
      end

      it 'returns false on nil JWT' do
        expect(user).not_to be_valid_jwt
      end

      it 'returns false on invalid JWT' do
        user.regenerate_token
        expect(user).not_to be_valid_jwt('123')
      end
    end

    describe 'password' do
      it 'returns true on valid password' do
        expect(user).to be_valid_password('password')
      end

      it 'returns false on invalid password' do
        expect(user).not_to be_valid_password('123')
      end
    end
  end
end
