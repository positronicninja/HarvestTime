class CreateEntries < ActiveRecord::Migration[5.1]
  def change
    create_table :entries do |t|
      t.string :notes
      t.decimal :hours,                 precision: 8, scale: 2
      t.references :staff,              foreign_key: true
      t.references :client,             foreign_key: true
      t.references :project,            foreign_key: true
      t.references :organization_task,  foreign_key: true
      t.integer :harvest_id,            index: true
      t.integer :harvest_task_id,       index: true
      t.integer :harvest_project_id,    index: true
      t.datetime :harvest_spent_on
      t.datetime :harvest_created_at
      t.datetime :harvest_updated_at

      t.timestamps
    end
  end
end
