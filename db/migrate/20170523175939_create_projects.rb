class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string :name
      t.boolean :active
      t.references :client,         foreign_key: true
      t.references :organization,   foreign_key: true
      t.references :collaboration,  foreign_key: true
      t.integer :harvest_id,        index: true
      t.datetime :harvest_starts_on
      t.datetime :harvest_created_at
      t.datetime :harvest_updated_at

      t.timestamps
    end
  end
end
