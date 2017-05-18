class CreateOrganizations < ActiveRecord::Migration[5.1]
  def change
    create_table :organizations do |t|
      t.string :name, nil: false
      t.string :base_uri
      t.string :full_domain
      t.string :harvest_id
      t.string :harvest_key
      t.boolean :active, nil: false, default: true

      t.timestamps
    end
  end
end
