class AddRaisonBanToUsers < ActiveRecord::Migration
  def change
    add_column :users, :raison_ban, :text
  end
end
