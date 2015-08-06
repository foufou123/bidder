class Contract < ActiveRecord::Base
  belongs_to :contractor
  belongs_to :job
  has_one    :bid
end
