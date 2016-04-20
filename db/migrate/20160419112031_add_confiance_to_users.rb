class AddConfianceToUsers < ActiveRecord::Migration
  def change
    add_column :users, :confiance, :boolean, :default => false
  end
end
