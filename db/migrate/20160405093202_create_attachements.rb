class CreateAttachements < ActiveRecord::Migration
  def change
    create_table :attachements do |t|
      t.string :label
    end
  end
end
