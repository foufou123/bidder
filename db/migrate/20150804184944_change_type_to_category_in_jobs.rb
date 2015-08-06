class ChangeTypeToCategoryInJobs < ActiveRecord::Migration
  def change
    rename_column :jobs, :type, :category
  end
end
