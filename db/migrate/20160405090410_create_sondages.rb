class CreateSondages < ActiveRecord::Migration
  def change
    create_table :sondages do |t|
      t.integer :publication_id
      t.datetime :date_fin
    end
  end
end
