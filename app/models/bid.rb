class Bid < ActiveRecord::Base
  belongs_to :job
  belongs_to :contractor
  belongs_to :contract
    # Job and Contractor will loose possession of Bid
    # and Bid will be in possession of Contract
    # once it has changed status to Winning Bid


  def self.lowest_bid
    order(:price).limit(1).first
  end

  def is_winning_bid?
    !contract.null? && job.null? && contractor.null?
  end
end
