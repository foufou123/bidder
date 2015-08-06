class CreateContracts < ActiveRecord::Migration
  def change
    create_table :contracts do |t|
      t.integer :user_id,     null: false
      t.integer :job_id,      null: false
      t.integer :bid_id,      null: false
      t.integer :binding_bid, null: false
      t.string :conditions

      t.timestamps null: false
    end
  end
end
