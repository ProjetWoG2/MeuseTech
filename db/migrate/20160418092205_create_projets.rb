class CreateProjets < ActiveRecord::Migration
  def change
    create_table :projets do |t|
      t.string :titre
      t.integer :categorie_id
      t.string :commune
      t.date :demarrage
      t.string :localisation
      t.string :statut
      t.text :description
      t.text :besoin
      t.string :image
      t.string :urlsite

      t.timestamps null: false
    end
  end
end
