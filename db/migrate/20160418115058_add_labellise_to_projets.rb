class AddLabelliseToProjets < ActiveRecord::Migration
  def change
    add_column :projets, :labellise, :boolean
  end
end
