# frozen_string_literal: true

class AuthorizedController < ApplicationController
  before_action :set_current_user
  before_action :authorize

  after_action :clear_current_user

  rescue_from ActiveRecord::RecordNotFound, with: :render_unauthorized

  private

  def authorization_token
    header = request.headers['Authorization']
    header.split[1].presence if header
  end

  def authorize
    render_unauthorized unless authorized?
  end

  def authorized?
    authorization_token && @current_user.jwt_valid?(authorization_token)
  end

  def clear_current_user
    @current_user = nil
  end

  def render_unauthorized
    render json: 'Unauthorized', status: :unauthorized
  end

  def set_current_user
    @current_user = User.find_by!(token: authorization_token)
  end
end
