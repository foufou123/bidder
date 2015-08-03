class Job < ActiveRecord::Base
  belongs_to :user
  belongs_to :contractor
  has_many   :bids
  has_one    :contract
  has_one    :contact, as: :contactable


  def lowest_bid
    bids.lowest_bid
  end
end
