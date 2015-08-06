class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      t.integer :job_id,  null: false
      t.integer :user_id, null: false
      t.integer :price,   null: false

      t.timestamps null: false
    end
  end
end
