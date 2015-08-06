class CreateSkillSets < ActiveRecord::Migration
  def change
    create_table :skill_sets do |t|
      t.string :contractor_id, null: false

      t.timestamps null: false
    end
  end
end
