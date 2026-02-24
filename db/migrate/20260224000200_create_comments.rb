class CreateComments < ActiveRecord::Migration[8.0]
  def change
    create_table :comments do |t|
      t.references :user, null: false, foreign_key: true
      t.text :content, null: false, default: ""
      t.boolean :privacy, null: false, default: false

      t.timestamps
    end
  end
end
