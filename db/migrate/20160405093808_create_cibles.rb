class CreateCibles < ActiveRecord::Migration
  def change
    create_table :cibles do |t|
      t.string :nom_table
    end
  end
end
