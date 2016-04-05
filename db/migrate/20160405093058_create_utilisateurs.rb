class CreateUtilisateurs < ActiveRecord::Migration
  def change
    create_table :utilisateurs do |t|
      t.string :commune
      t.integer :code_postal
      t.string :pays
      t.integer :attachement_id
      t.integer :nb_commentaires
      t.integer :nb_projets_suivis
    end
  end
end
