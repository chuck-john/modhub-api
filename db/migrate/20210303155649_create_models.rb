# frozen_string_literal: true

class CreateModels < ActiveRecord::Migration[6.1]
  def change
    create_table :models do |t|
      t.timestamps
      t.belongs_to :make, null: false, foreign_key: true
      t.string :name, :kind, null: false
      t.index %i[name make_id], unique: true
    end
  end
end
