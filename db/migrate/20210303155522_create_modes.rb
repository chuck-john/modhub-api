# frozen_string_literal: true

class CreateModes < ActiveRecord::Migration[6.1]
  def change
    create_table :modes do |t|
      t.timestamps
      t.string :name, null: false
      t.string :slug, null: false, index: { unique: true }
    end
  end
end
