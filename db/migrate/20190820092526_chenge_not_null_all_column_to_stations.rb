class ChengeNotNullAllColumnToStations < ActiveRecord::Migration[5.0]
  def change
    change_column_null :stations, :line, false, 0
    change_column_null :stations, :name, false, 0
    change_column_null :stations, :walk_time, false, 0
  end
end
