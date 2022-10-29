class CreateInventories < ActiveRecord::Migration[7.0]
  def change
    create_table :inventories do |t|
      t.string :name
      t.references :user, null: false, foreign_key: {to_table: 'users'}, index: true

      t.timestamps
    end
  end
end
