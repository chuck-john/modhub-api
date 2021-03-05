# frozen_string_literal: true

class CreateGarages < ActiveRecord::Migration[6.1]
  def change
    create_table :garages do |t|
      t.timestamps
      t.belongs_to :user, null: false, foreign_key: true
      t.string :name, null: false
      t.string :location
    end
  end
end
