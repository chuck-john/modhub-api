# frozen_string_literal: true

class CreateMakes < ActiveRecord::Migration[6.1]
  def change
    create_table :makes do |t|
      t.timestamps
      t.string :name, null: false, index: { unique: true }
    end
  end
end
