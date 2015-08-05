class Interest < ActiveRecord::Base
  belongs_to :contractor
  belongs_to :job
  has_many   :bids

  validates_presence_of   :contractor
  validates_presence_of   :job
  validates_uniqueness_of :contractor, -> { where.(job: job) }
  validates_uniqueness_of :job,        -> { where.(contractor: contractor) }
end
