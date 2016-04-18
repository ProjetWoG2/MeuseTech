class AddUseridToProjets < ActiveRecord::Migration
  def change
    add_column :projets, :user_id, :integer
  end
end
