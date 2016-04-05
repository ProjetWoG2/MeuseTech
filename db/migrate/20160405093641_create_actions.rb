class CreateActions < ActiveRecord::Migration
  def change
    create_table :actions do |t|
      t.string :label
    end
  end
end
