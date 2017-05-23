class CreateStaffs < ActiveRecord::Migration[5.1]
  def change
    create_table :staffs do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.boolean :active
      t.references :organization, foreign_key: true
      t.integer :harvest_id,      index: true
      t.datetime :harvest_created_at
      t.datetime :harvest_updated_at

      t.timestamps
    end
  end
end
