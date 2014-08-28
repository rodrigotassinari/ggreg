class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.datetime :published_at
      t.timestamps
    end
    add_index :posts, :published_at
  end
end
