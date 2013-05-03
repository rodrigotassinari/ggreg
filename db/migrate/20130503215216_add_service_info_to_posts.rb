class AddServiceInfoToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :source, :string, null: false
    add_column :posts, :action, :string, null: false
    add_column :posts, :identifier, :string, null: false
    add_column :posts, :url, :string
    add_column :posts, :published_at, :datetime, null: false

    add_index :posts, :published_at
    add_index :posts, :source
    add_index :posts, [:source, :action]
    add_index :posts, [:source, :action, :identifier], unique: true
  end
end
