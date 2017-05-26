class CreateOrganizationTasks < ActiveRecord::Migration[5.1]
  def up
    create_table :organization_tasks do |t|
      t.string :name
      t.references :organization,   foreign_key: true
      t.references :task,           foreign_key: true
      t.integer :harvest_id
      t.datetime :harvest_created_at
      t.datetime :harvest_updated_at

      t.timestamps
    end
  end

  def down
    Entry.destroy_all
    drop_table :organization_tasks
  end
end
