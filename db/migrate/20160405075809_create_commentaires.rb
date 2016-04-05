class CreateCommentaires < ActiveRecord::Migration
  def change
    create_table :commentaires do |t|
      t.integer :interaction_id
      t.string :contenu
    end
  end
end
