class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :commune
      t.integer :code_postal
      t.string :pays
      t.integer :attachement_id
      t.integer :nb_commentaires
      t.integer :nb_projets_suivis
      t.belongs_to :user, index:true
    end
  end
end
