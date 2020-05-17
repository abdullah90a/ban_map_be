# frozen_string_literal: true

class CreateBanTable < ActiveRecord::Migration[5.2]
  def change
    create_table :bans do |t|
      t.string :name, null: false
      t.date :enacted, null: true
      t.date :proposed, null: true
      t.integer :population, null: false
      t.string :type, null: false
      t.string :stage, null: false
      t.references :city, foreign_key: true
      t.timestamps
    end
  end
end
