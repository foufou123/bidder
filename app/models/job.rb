class Job < ActiveRecord::Base
  belongs_to :user
  has_many   :interests
  belongs_to :contractor
  has_many   :bids, through: :interests
  has_one    :contract
  has_one    :contact, as: :contactable
  belongs_to :portfolio # Possibly scope this as only when :completed is true


  def lowest_bid
    bids.lowest_bid
  end

  def completed!
    update_attributes(completed: true, portfolio: contract.contractor.portfolio)
    #TODO: payments??
  end
end
