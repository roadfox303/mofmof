class ChengeNotNullAllColumnToProperties < ActiveRecord::Migration[5.0]
  def change
    change_column_null :properties, :name, false, 0
    change_column_null :properties, :address, false, 0
    change_column_null :properties, :price, false, 0
    change_column_null :properties, :building_year, false, 0
    change_column_null :properties, :note, false, 0
  end
end
