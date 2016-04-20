class AddVisibleToComments < ActiveRecord::Migration
  def change
    add_column :comments, :visible, :boolean
  end
end
