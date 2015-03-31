class CreateIntegrations < ActiveRecord::Migration
  def change
    create_table :integrations do |t|
      t.string :type
      t.json :configuration, null: false, default: '{}'
      t.timestamps null: false
    end
  end
end
