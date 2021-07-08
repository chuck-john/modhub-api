# frozen_string_literal: true

class VehiclesController < AuthorizedController
  def create
    garage = @current_user.garages.find(vehicle_params[:garage_id])
    vehicle = garage.vehicles.create!(vehicle_params.except(:garage_id))
    render_json(vehicle, :created)
  end

  def destroy
    @current_user.vehicles.find(params[:id]).destroy!
    render_json(nil, :no_content)
  end

  private

  def vehicle_params
    params.require(:vehicle).permit(:garage_id, :trim_id, :year)
  end
end
