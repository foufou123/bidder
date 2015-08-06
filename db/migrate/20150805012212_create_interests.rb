class CreateInterests < ActiveRecord::Migration
  def change
    create_table :interests do |t|
      t.integer :contractor_id, null: false
      t.integer :job_id,        null: false

      t.timestamps null: false
    end
  end
end
