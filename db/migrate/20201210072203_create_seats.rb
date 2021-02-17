class CreateSeats < ActiveRecord::Migration[5.2]
  def change
    create_table :seats do |t|
      t.string :en_number # 英字列
      t.string :number    # 数字列

      t.timestamps
    end
  end
end
