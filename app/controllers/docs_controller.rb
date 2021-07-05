# frozen_string_literal: true

class DocsController < ApplicationController
  include RootDoc

  def index
    render json: DocGenerator.call
  end
end
