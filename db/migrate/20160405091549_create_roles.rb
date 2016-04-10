class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :label
    end
  end
end
