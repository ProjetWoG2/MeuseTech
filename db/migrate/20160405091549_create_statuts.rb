class CreateStatuts < ActiveRecord::Migration
  def change
    create_table :statuts do |t|
      t.string :label
    end
  end
end
