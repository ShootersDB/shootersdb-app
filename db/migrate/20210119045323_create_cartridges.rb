class CreateCartridges < ActiveRecord::Migration[6.0]
  def change
    create_table :cartridges do |t|
      t.string :name

      t.timestamps
    end
  end
end
