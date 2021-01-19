class CreateReloadingChecklistSteps < ActiveRecord::Migration[6.0]
  def change
    create_table :reloading_checklist_steps do |t|
      t.string :name

      t.timestamps
    end
  end
end
