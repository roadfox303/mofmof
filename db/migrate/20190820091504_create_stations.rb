class CreateStations < ActiveRecord::Migration[5.0]
  def change
    create_table :stations do |t|
      t.string "line"
      t.string "name"
      t.integer "walk_time"
      t.timestamps
    end
  end
end
