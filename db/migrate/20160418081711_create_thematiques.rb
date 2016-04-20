class CreateThematiques < ActiveRecord::Migration
  def change
    create_table :thematiques do |t|
      t.string :categorie
    end
  end
end
