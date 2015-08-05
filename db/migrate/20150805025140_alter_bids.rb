class AlterBids < ActiveRecord::Migration
  def change
    remove_column :bids, :job_id
    remove_column :bids, :contractor_id
    add_column    :bids, :interest_id,  :integer
  end
end
