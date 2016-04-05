class CreateJoinTableArticleMedia < ActiveRecord::Migration
  def change
    create_join_table :media, :articles do |t|
      # t.index [:media_id, :article_id]
      # t.index [:article_id, :media_id]
    end
  end
end
