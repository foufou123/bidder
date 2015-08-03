class Contract < ActiveRecord::Base
  belongs_to :user
  belongs_to :job
  belongs_to :bid
end
