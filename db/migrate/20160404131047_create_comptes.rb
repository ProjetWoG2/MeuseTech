class CreateComptes < ActiveRecord::Migration
  def change
    create_table :comptes do |t|

      t.timestamps null: false
    end
  end
end
