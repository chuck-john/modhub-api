# frozen_string_literal: true

class TrimsController < ApplicationController
  include TrimsControllerDoc

  before_action :set_model
  before_action :set_trims

  def index
    render_json(@trims)
  end

  private

  def set_model
    @model = Model.find(params[:model_id])
  end

  def set_trims
    @trims = @model.trims.order(:name)
  end
end
