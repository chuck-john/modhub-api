# frozen_string_literal: true

class KindsController < ApplicationController
  before_action :set_kinds

  def index
    render_json(@kinds)
  end

  private

  def set_kinds
    @kinds = Model.kinds.flat_map { |kind| %i[id name].zip(kind).to_h }
  end
end
