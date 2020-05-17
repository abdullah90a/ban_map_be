# frozen_string_literal: true

class AddFieldsToCities < ActiveRecord::Migration[5.2]
  def change
    remove_column :cities, :population
    add_column :cities, :population, :integer
    add_column :cities, :zips, :string
  end
end
