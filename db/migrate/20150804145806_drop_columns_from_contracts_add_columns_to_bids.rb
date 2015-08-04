class DropColumnsFromContractsAddColumnsToBids < ActiveRecord::Migration
  def change
    remove_column :contracts, :bid_id
    remove_column :contracts, :binding_bid
    add_column    :contracts, :stipulations, :text

    add_column    :bids, :contract_id, :integer, null: true
    change_column :bids, :job_id,      :integer, null: true
    change_column :bids, :user_id,     :integer, null: true
  end
end
