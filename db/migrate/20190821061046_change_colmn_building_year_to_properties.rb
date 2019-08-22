class ChangeColmnBuildingYearToProperties < ActiveRecord::Migration[5.0]
  def change
    change_column :properties, :building_year, :integer
  end
end
