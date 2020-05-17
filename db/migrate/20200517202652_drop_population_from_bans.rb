# frozen_string_literal: true

class DropPopulationFromBans < ActiveRecord::Migration[5.2]
  def change
    remove_column :bans, :population
  end
end
