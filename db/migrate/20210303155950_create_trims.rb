# frozen_string_literal: true

class CreateTrims < ActiveRecord::Migration[6.1]
  def change
    create_table :trims do |t|
      t.timestamps
      t.belongs_to :model, null: false, foreign_key: true
      t.string :name, null: false
      t.integer :years, null: false, array: true, default: []
      t.index %i[name model_id], unique: true
    end
  end
end
