class Bid < ActiveRecord::Base
  belongs_to :interest
  belongs_to :contract

  validates_presence_of :interest

  def self.lowest_bid
    order(:price).limit(1).first
  end

  def winning_bid?
    #!contract.null? TODO: Change this
  end

  def winner!
    interest.job.build_contract(contractor: interest.contractor).save
  end
end
