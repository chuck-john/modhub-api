# frozen_string_literal: true

require 'rails_helper'

describe User, type: :model do # rubocop:disable Metrics/BlockLength
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

    it 'fails on blank password' do
      user.password_digest = ''
      user.validate
      expect(user.errors.full_messages).to include("Password can't be blank")
    end
  end

  describe 'instance methods' do # rubocop:disable Metrics/BlockLength
    let(:user) { users(:one) }

    describe 'JWT' do
      before { user.regenerate_token }

      it 'returns true on valid JWT' do
        expect(user).to be_valid_jwt
      end

      it 'returns false on blank JWT' do
        user.token = nil
        expect(user).not_to be_valid_jwt
      end

      it 'returns false on expired JWT' do
        payload = user.new_jwt_payload.merge(exp: 1.day.ago.to_i)
        user.regenerate_token(payload)
        expect(user).not_to be_valid_jwt
      end

      it 'returns false on invalid aud' do
        payload = user.new_jwt_payload.merge(aud: users(:two).id)
        user.regenerate_token(payload)
        expect(user).not_to be_valid_jwt
      end

      it 'returns false on future nbf' do
        payload = user.new_jwt_payload.merge(nbf: 1.day.from_now.to_i)
        user.regenerate_token(payload)
        expect(user).not_to be_valid_jwt
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
