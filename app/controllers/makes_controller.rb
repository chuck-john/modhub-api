# frozen_string_literal: true

class MakesController < ApplicationController
  before_action :set_makes

  def index
    render_json(@makes)
  end

  private

  def set_makes
    @makes = Make.order(:name)
  end
end
