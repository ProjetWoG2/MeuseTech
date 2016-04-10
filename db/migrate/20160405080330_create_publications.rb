class CreatePublications < ActiveRecord::Migration
  def change
    create_table :publications do |t|
      t.boolean :online
      t.integer :user_id
      t.date :online_date
      t.text :titre
    end
  end
end
