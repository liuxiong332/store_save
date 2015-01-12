class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.string :username, index: true
      t.string :password

      t.timestamps null: false
    end
  end
end
