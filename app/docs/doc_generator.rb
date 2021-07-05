# frozen_string_literal: true

class DocGenerator
  CLASSES = [
    DocsController,
    ErrorModel,
    Make,
    MakesController,
    Mode,
    ModesController,
    Model,
    ModelsController,
    TokensController,
    Trim,
    TrimsController
  ].freeze

  def self.call
    Swagger::Blocks.build_root_json(CLASSES)
  end
end
