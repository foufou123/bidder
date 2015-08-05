class AddIdColumnsToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :user_id, :integer, null: false
  end
end
