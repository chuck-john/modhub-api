# frozen_string_literal: true

class GaragesController < AuthorizedController
  def create
    garage = @current_user.garages.create!(garage_params)
    render_json(garage, :created)
  end

  def destroy
    @current_user.garages.find(params[:id]).destroy!
    render_json(nil, :no_content)
  end

  private

  def garage_params
    params.require(:garage).permit(:location, :name)
  end
end
