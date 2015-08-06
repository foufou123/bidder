class DropColumnsFromContractsAddColumnsToBids < ActiveRecord::Migration
  def change
    remove_column :contracts, :bid_id
    remove_column :contracts, :binding_bid
    add_column    :contracts, :stipulations, :text

    remove_column :bids, :user_id
    add_column    :bids, :contract_id,   :integer, null: true
    change_column :bids, :job_id,        :integer, null: true
    add_column    :bids, :contractor_id, :integer, null: true
  end
end
