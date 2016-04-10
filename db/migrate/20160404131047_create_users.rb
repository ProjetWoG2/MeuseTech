class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.belongs_to :role, index:true
      t.string :nom
      t.string :prenom
      t.string :pseudo
      t.integer :role
      t.timestamps null: false
    end
  end
end
