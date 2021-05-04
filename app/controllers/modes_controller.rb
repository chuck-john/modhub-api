# frozen_string_literal: true

class ModesController < ApplicationController
  before_action :set_modes

  def index
    render_json(@modes)
  end

  private

  def set_modes
    @modes = Mode.order(:name)
  end
end
