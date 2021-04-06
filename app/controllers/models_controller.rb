# frozen_string_literal: true

class ModelsController < ApplicationController
  before_action :set_make
  before_action :set_models

  def index
    render_json(@models)
  end

  private

  def set_make
    @make = Make.find(params[:make_id])
  end

  def set_models
    @models = @make.models.where(kind: params[:kind]).order(:name)
  end
end
