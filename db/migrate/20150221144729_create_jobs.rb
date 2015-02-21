class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :name
      t.text :description
      t.string :phone
      t.string :location
      t.string :zipcode

      t.timestamps
    end
  end
end
