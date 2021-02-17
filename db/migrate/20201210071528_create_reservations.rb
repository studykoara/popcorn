class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.references :performance, null: false # 上映
      t.references :member, null: false # メンバー

      t.timestamps
    end
  end
end
