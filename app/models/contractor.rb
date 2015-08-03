class Contractor < ActiveRecord::Base
  belongs_to :user
  has_many   :jobs
  has_many   :bids
  has_many   :contracts
  has_one    :contact, as: :contactable
  has_one    :portfolio
end
