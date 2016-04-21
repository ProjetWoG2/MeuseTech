class AddIsBanToUsers < ActiveRecord::Migration
  def change
    add_column :users, :is_ban, :boolean, :default => false
  end
end
