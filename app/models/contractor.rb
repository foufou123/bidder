class Contractor < ActiveRecord::Base
  after_create :create_defaults

  belongs_to :user
  has_many   :interests
  has_many   :bids, through: :interests
  has_many   :contracts
  has_many   :jobs, through: :contracts
  has_one    :contact, as: :contactable
  has_one    :portfolio
  has_one    :skill_set

private
  def create_defaults
    build_contact.save
    build_skill_set.save
    build_portfolio.save
  end
end
