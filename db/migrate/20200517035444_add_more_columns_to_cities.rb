class AddMoreColumnsToCities < ActiveRecord::Migration[5.2]
  def change
    change_column :cities, :zips, :string, null: false, default: ''
    change_column :cities, :population, :integer, null: false, default: 0
    add_column :cities, :density, :integer, null: false, default: 0
    add_column :cities, :county, :string, null: false, default: ''
  end
end
