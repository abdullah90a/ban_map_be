# frozen_string_literal: true

class CreateCities < ActiveRecord::Migration[5.2]
  def change
    create_table :cities do |t|
      t.string :name, null: false
      t.decimal :latitude, null: false
      t.decimal :longitude, null: false
      t.string :population, null: false
      t.timestamps
    end
  end
end
