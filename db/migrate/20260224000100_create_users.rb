class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.text :name, null: false
      t.text :key, null: false
      t.boolean :privacy, null: false, default: false

      t.timestamps
    end

    add_index :users, :key, unique: true
  end
end
