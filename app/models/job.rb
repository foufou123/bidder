class Job < ActiveRecord::Base
  belongs_to :user
  has_many   :interests
  belongs_to :contractor
  has_many   :bids, through: :interests
  has_one    :contract
  has_one    :contact, as: :contactable


  def lowest_bid
    bids.lowest_bid
  end
end
