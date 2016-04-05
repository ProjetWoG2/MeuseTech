class CreateJoinTableMediumArticle < ActiveRecord::Migration
  def change
    create_join_table :media, :articles do |t|
      # t.index [:medium_id, :article_id]
      # t.index [:article_id, :medium_id]
    end
  end
end
