class CreateSmokelessPowders < ActiveRecord::Migration[6.0]
  def change
    create_table :smokeless_powders do |t|
      t.string :name
      t.references :manufacturer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
