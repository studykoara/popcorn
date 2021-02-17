class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :title, null: false
      t.string :story, null: false
      t.date :release_date, null: false
      t.integer :running_time, null: false
      t.string :distribution, null: false
      t.string :director, null: false
      t.string :actor, null: false

      t.timestamps
    end
  end
end
