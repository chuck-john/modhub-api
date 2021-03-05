# frozen_string_literal: true

class SessionsController < AuthorizedController
  def create
    @current_user.regenerate_token
    render json: serialize(@current_user), status: :created
  end

  def destroy
    @current_user.update!(token: nil)
    render json: serialize(@current_user), status: :no_content
  end

  private

  def authorized?
    return super if authorization_token

    @current_user.password_valid?(user_params[:password])
  end

  def set_current_user
    return super if authorization_token

    @current_user = User.find_by!(email: user_params[:email])
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
