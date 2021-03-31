class AddCartridgeToManufacturerLoadDatum < ActiveRecord::Migration[6.0]
  def change
    add_reference :manufacturer_load_data, :cartridge, null: false, foreign_key: true
  end
end
