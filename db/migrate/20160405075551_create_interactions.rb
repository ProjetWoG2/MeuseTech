class CreateInteractions < ActiveRecord::Migration
  def change
    create_table :interactions do |t|
      t.string :type
      t.integer :article_id
      t.integer :user_id
    end
  end
end
