class CreateUserReloadingChecklistSteps < ActiveRecord::Migration[6.0]
  def change
    create_table :user_reloading_checklist_steps do |t|
      t.string :name
      t.references :user, null: false, foreign_key: true
      t.references :user_reloading_checklist, null: false, foreign_key: true, index: { name: 'index_steps_on_checklist_id' }
      t.integer :order

      t.timestamps
    end
  end
end
