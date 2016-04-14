class CreateActualites < ActiveRecord::Migration
  def change
    create_table :actualites do |t|
      t.string :title
      t.text :content
      t.datetime :created_at
      t.datetime :updated_at
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
