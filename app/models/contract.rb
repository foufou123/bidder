class Contract < ActiveRecord::Base
  belongs_to :user
  belongs_to :job
  has_one    :bid
end
