class CreateLobsters < ActiveRecord::Migration[5.2]
  def change
    create_table :lobsters do |t|
      t.string :zip, null: false
      t.string :address, null: false
      t.string :phone, null: false
      t.references :city, foreign_key: true
      t.timestamps
    end
  end
end
