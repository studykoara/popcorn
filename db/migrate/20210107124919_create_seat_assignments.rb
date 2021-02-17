class CreateSeatAssignments < ActiveRecord::Migration[5.2]
  def change
    create_table :seat_assignments do |t|
      t.references :seat, null: false
      t.references :reservation, null: false

      t.timestamps
    end
  end
end
