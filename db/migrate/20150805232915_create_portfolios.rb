class CreatePortfolios < ActiveRecord::Migration
  def change
    create_table :portfolios do |t|
      t.integer :contractor_id, null: false

      t.timestamps null: false
    end
  end
end
