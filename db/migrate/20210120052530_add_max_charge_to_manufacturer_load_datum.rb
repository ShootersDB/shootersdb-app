class AddMaxChargeToManufacturerLoadDatum < ActiveRecord::Migration[6.0]
  def change
    add_column :manufacturer_load_data, :max_charge, :boolean, default: false
  end
end
