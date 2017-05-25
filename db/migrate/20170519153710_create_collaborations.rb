class CreateCollaborations < ActiveRecord::Migration[5.1]
  def change
    create_table :collaborations do |t|
      t.string :name

      t.timestamps
    end
  end
end
