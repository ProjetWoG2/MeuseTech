class AddDateToCommentaires < ActiveRecord::Migration
  def change
    add_column :commentaires, :date, :datetime
  end
end
