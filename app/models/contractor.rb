class Contractor < ActiveRecord::Base
  after_create :create_contractor_defaults

  belongs_to :user
  has_many   :interests
  has_many   :bids, through: :interests
  has_many   :contracts
  has_many   :jobs, through: :contracts
  has_one    :contact, as: :contactable
  has_one    :portfolio

private
  def create_contractor_defaults
    build_portfolio.save
  end
end
