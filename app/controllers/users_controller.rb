# frozen_string_literal: true

class UsersController < AuthorizedController
  skip_before_action :authorize, only: :create

  def create
    render_json @current_user, :created
  end

  def update
    @current_user.update!(user_params)
    render_json @current_user, :no_content
  end

  def destroy
    @current_user.destroy!
    render_json @current_user, :no_content
  end

  private

  def set_current_user
    return super unless create_action?

    @current_user = User.create!(user_params)
  end

  def user_params
    params.require(:user).permit(:email, :name, :password, :password_confirmation)
  end
end
