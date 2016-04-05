class AddChampsToComptes < ActiveRecord::Migration
  def change
    add_column :comptes, :nom, :string
    add_column :comptes, :prenom, :string
    add_column :comptes, :pseudo, :string
    add_column :comptes, :statut_id, :integer
  end
end
