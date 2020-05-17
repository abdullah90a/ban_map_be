# frozen_string_literal: true

class DropNameFromBans < ActiveRecord::Migration[5.2]
  def change
    remove_column :bans, :name
  end
end
