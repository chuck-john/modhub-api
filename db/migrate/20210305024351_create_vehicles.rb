# frozen_string_literal: true

class CreateVehicles < ActiveRecord::Migration[6.1]
  def change
    create_table :vehicles do |t|
      t.timestamps
      t.belongs_to :garage, null: false, foreign_key: true
      t.belongs_to :trim, null: false, foreign_key: true
      t.integer :year, null: false
    end
  end
end
