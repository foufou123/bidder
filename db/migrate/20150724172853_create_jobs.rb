class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :name,      null: false
      t.string :type,      null: false
      t.text :description, null: false

      t.timestamps null: false
    end
  end
end
