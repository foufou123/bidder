class CreateContractors < ActiveRecord::Migration
  def change
    create_table :contractors do |t|
      t.integer :user_id,          null: false
      t.string :organization_type, null: false
      t.string :organization_name, null: false
      t.text :summary,             null: false

      t.timestamps null: false
    end
  end
end
