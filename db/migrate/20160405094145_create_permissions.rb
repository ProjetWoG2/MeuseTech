class CreatePermissions < ActiveRecord::Migration
  def change
    create_table :permissions do |t|
      t.integer :statut_id
      t.integer :cible_id
      t.integer :action_id
      t.boolean :droit
    end
  end
end
