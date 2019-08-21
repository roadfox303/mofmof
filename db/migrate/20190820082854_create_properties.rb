class CreateProperties < ActiveRecord::Migration[5.0]
  def change
    create_table :properties do |t|
      t.string "name"
      t.string "address"
      t.integer "price"
      t.date "building_year"
      t.text "note"
      t.timestamps
    end
  end
end
