# frozen_string_literal: true

class AuthorizedController < ApplicationController
  before_action :set_current_user
  before_action :authorize

  after_action :clear_current_user

  rescue_from ActiveRecord::RecordInvalid, with: :render_errors
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
    @current_user.valid_jwt?(authorization_token)
  end

  def clear_current_user
    @current_user = nil
  end

  def render_errors(error)
    render_json(error.record.errors, :unprocessable_entity)
  end

  def render_unauthorized(error = nil)
    render_json(error&.message || 'Unauthorized', :unauthorized)
  end

  def set_current_user
    @current_user = User.find_by!(token: authorization_token)
  end
end
