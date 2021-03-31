class CreateManufacturerLoadData < ActiveRecord::Migration[6.0]
  def change
    create_table :manufacturer_load_data do |t|
      t.references :manufacturer, null: false, foreign_key: true
      t.references :bullet, null: false, foreign_key: true
      t.references :smokeless_powder, null: false, foreign_key: true
      t.string :coal
      t.string :cbto
      t.float :powder_charge
      t.float :velocity

      t.timestamps
    end
  end
end
