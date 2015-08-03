class Bid < ActiveRecord::Base
  belongs_to :job
  belongs_to :contractor
  has_one    :contract


  def self.lowest_bid
    order(:price).limit(1).first
  end
end
