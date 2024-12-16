class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.references :user, null: false, foreign_key: true
      t.float :weight, null: false
      t.datetime :start_time, null: false

      t.timestamps
    end
  end
end
