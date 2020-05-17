class ChangeCoordsScale < ActiveRecord::Migration[5.2]
  def change
    change_column :cities, :latitude, :decimal, precision: 10, scale: 5, default: 0.0, null: false
    change_column :cities, :longitude, :decimal, precision: 10, scale: 5, default: 0.0, null: false
  end
end
