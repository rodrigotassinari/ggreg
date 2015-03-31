class CreateUsers < ActiveRecord::Migration
  def change
    enable_extension 'citext'
    create_table :users do |t|
      t.citext :email, null: false
      t.string :password_digest, null: false
      t.timestamps null: false
    end
    add_index :users, :email, unique: true
  end
end
