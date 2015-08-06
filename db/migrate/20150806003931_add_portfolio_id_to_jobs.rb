class AddPortfolioIdToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :completed, :boolean, default: false
    add_column :jobs, :portfolio_id, :integer
  end
end
