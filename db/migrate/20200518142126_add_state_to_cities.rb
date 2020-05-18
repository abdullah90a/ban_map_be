class AddStateToCities < ActiveRecord::Migration[5.2]
  def change
    add_reference :cities, :state, index: true, foreign_key: true
  end
end
