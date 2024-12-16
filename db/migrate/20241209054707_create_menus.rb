class CreateMenus < ActiveRecord::Migration[6.1]
  def change
    create_table :menus do |t|
      t.references :post, null: false, foreign_key: true
      t.references :genre, null: false, foreign_key: true
      t.string :name
      t.integer :number_of_times

      t.timestamps
    end
  end
end
