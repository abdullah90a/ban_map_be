class ChangeBanTypeColumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :bans, :type, :ban_type
  end
end
