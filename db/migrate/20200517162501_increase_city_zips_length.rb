class IncreaseCityZipsLength < ActiveRecord::Migration[5.2]
  def change
    change_column :cities, :zips, :text, default: nil
  end
end
