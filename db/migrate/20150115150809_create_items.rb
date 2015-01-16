class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title
      t.references :storage, index: true

      t.timestamps null: false
    end
    add_foreign_key :items, :storages

  end
end
