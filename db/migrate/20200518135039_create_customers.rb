class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :zip, null: false, default: ""
      t.references :city, foreign_key: true
    end
  end
end
