class CreateKinds < ActiveRecord::Migration[5.2]
  def change
    create_table :kinds do |t|
      t.string :kind_name # 券種名
      t.integer :fee # 料金

      t.timestamps
    end
  end
end
