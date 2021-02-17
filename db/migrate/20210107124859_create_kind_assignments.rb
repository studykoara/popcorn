class CreateKindAssignments < ActiveRecord::Migration[5.2]
  def change
    create_table :kind_assignments do |t|
      t.references :kind, null: false
      t.references :reservation, null: false

      t.timestamps
    end
  end
end
