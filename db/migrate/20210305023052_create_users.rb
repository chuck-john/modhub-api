# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.timestamps
      t.string :name, null: false
      t.string :email, null: false, index: { unique: true }
      t.string :password_digest, null: false
      t.string :token
    end
  end
end
