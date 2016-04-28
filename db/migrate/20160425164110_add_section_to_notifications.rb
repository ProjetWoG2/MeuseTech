class AddSectionToNotifications < ActiveRecord::Migration
  def change
    add_column :notifications, :section, :string
    rename_column :notifications, :type, :contenu
  end
end
