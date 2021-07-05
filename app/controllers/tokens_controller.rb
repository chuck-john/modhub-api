# frozen_string_literal: true

class TokensController < AuthorizedController
  def create
    @current_user.regenerate_token
    render_json(@current_user, :created)
  end

  def destroy
    @current_user.update!(token: nil)
    render_json(@current_user, :no_content)
  end

  private

  def authorized?
    return super unless create_action?

    @current_user.valid_password?(user_params[:password])
  end

  def set_current_user
    return super unless create_action?

    @current_user = User.find_by!(email: user_params[:email])
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
