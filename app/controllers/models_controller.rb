# frozen_string_literal: true

class ModelsController < ApplicationController
  include ModelsControllerDoc

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
    @models = @make.models.order(:name)
  end
end
