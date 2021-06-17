# frozen_string_literal: true

class User < ApplicationRecord
  JWT_KEY = Rails.application.credentials[:jwt_key]

  has_many :garages, dependent: :destroy
  has_many :vehicles, through: :garages

  with_options presence: true do
    validates :email, uniqueness: { case_sensitive: false }, format: { with: /\A.+@.+\z/ }
    validates :name
  end

  has_secure_password

  def jwt_payload
    JWT.decode(token, JWT_KEY, true, aud: id, verify_aud: true).first.deep_symbolize_keys
  end

  def new_jwt_payload
    { aud: id, exp: 1.week.from_now.to_i, nbf: Time.current.to_i }
  end

  def regenerate_token(payload = new_jwt_payload)
    update! token: JWT.encode(payload, JWT_KEY)
    token
  end

  def to_s
    name
  end

  def valid_jwt?(string = token)
    string == token && jwt_payload.is_a?(Hash)
  rescue JWT::DecodeError => _error
    false
  end

  def valid_password?(string)
    authenticate(string) == self
  end
end

# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  email           :string           not null
#  name            :string           not null
#  password_digest :string           not null
#  token           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#
