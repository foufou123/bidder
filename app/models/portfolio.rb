class Portfolio < ActiveRecord::Base
  belongs_to :contractor
  has_many   :jobs
  has_many   :showcases ##! Jobs outside of Bidder.
                        # Should only include the best
                        # As in (showcases)
                        # May want to call this something different

end
