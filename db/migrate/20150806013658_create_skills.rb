class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.integer :skill_set_id, null: false
      t.integer :skill_tag_id, null: false
      t.integer :years,        null: false
      t.integer :proficiency,  null: false

      t.timestamps null: false
    end
  end
end
