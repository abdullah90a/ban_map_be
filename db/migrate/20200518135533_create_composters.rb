class CreateComposters < ActiveRecord::Migration[5.2]
  def change
    create_table :composters do |t|
      t.string :name, null: false
      t.string :url, null: false, default: ""
      t.string :email, null: false, default: ""
      t.string :phone, null: false, default: ""
      t.boolean :active, null: false
      t.references :city, foreign_key: true
    end
  end
end