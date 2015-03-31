class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.datetime :published_at
      t.timestamps null: false
    end
    add_index :posts, :published_at
    add_index :posts, :created_at
    add_index :posts, :updated_at
  end
end
