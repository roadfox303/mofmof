class AddForeignKeyToStations < ActiveRecord::Migration[5.0]
  def change
    add_reference :stations, :user, foreign_key: true
  end
end
