class CreateProjets < ActiveRecord::Migration
  def change
    create_table :projets do |t|
      t.string :localisation
      t.string :theme
      t.date :date_lancement
      t.text :besoins
      t.integer :article_id
      t.string :territoire
      t.string :etat_avancement
      t.string :lien_url
    end
  end
end
