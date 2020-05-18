class CreateFacilities < ActiveRecord::Migration[5.2]
  def change
    create_table :facilities do |t|
      t.string :name, null: false
      t.string :address, null: false
      t.string :postal_code, null: false
      t.string :capability, null: false
      t.references :city, foreign_key: true
    end
  end
end
