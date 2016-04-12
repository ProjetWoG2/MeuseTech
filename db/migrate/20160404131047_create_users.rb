class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :nom
      t.string :prenom
      t.string :pseudo
      t.integer :role_id, :default => "3"
      t.timestamps null: false
    end
  end
end
