class CreateBullets < ActiveRecord::Migration[6.0]
  def change
    create_table :bullets do |t|
      t.string :name
      t.references :manufacturer, null: false, foreign_key: true
      t.float :diameter
      t.float :weight
      t.float :g1_bc
      t.float :g7_bc
      t.string :mpn

      t.timestamps
    end
  end
end
