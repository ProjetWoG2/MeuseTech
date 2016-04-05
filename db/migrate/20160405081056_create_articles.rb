class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.text :contenu
      t.integer :publication_id
    end
  end
end
