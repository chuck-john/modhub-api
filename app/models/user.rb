# frozen_string_literal: true

class User < ApplicationRecord
  JWT_KEY = Rails.application.credentials[:jwt_key]

  after_create :regenerate_token

  has_many :garages, dependent: :destroy
  has_many :vehicles, through: :garages

  with_options presence: true do
    validates :email, uniqueness: { case_sensitive: false }, format: { with: /\A.+@.+\z/ }
    validates :name
  end

  has_secure_password

  def jwt_valid?(string)
    token == string && jwt_payload[:aud] == id && jwt_live?
  rescue JWT::DecodeError
    false
  end

  def password_valid?(string)
    authenticate(string) == self
  end

  def regenerate_token
    payload = { aud: id, exp: 1.week.from_now.to_i, iat: Time.current.to_i }
    update! token: JWT.encode(payload, JWT_KEY)
  end

  def to_s
    name
  end

  private

  def jwt_live?
    jwt_payload[:exp] > Time.current.to_i
  end

  def jwt_payload
    JWT.decode(token, JWT_KEY).first.deep_symbolize_keys
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
