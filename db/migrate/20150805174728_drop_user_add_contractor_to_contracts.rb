class DropUserAddContractorToContracts < ActiveRecord::Migration
  def change
    remove_column :contracts, :user_id
    add_column    :contracts, :contractor_id, :integer, null: false
  end
end
