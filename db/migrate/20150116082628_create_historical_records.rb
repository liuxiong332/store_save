class CreateHistoricalRecords < ActiveRecord::Migration
  def change
    create_table :historical_records do |t|
      t.references :user, index: true
      t.integer :operation
      t.references :item, index: true
      t.references :storage, index: true

      t.timestamps null: false
    end
    add_foreign_key :historical_records, :users
    add_foreign_key :historical_records, :items
    add_foreign_key :historical_records, :storages
  end
end
