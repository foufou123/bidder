require 'rails_helper'

RSpec.describe Portfolio, type: :model do
  let(:user1) { FactoryGirl.create(:job_creator) }
  let(:user2) { FactoryGirl.create(:contractor_user) }
  let(:user3) { FactoryGirl.create(:competitor_user) }
  let(:contractor1) { FactoryGirl.create(:good_contractor) }
  let(:contractor2) { FactoryGirl.create(:competitor_contractor) }
  let(:cabinet_job) { FactoryGirl.create(:cabinet_job) }
  let(:another_cabinet_job) { FactoryGirl.create(:another_cabinet_job) }
  let(:interest1) { FactoryGirl.create(:good_interest) }
  let(:interest2) { FactoryGirl.create(:competitor_interest) }

  it "should be a valid instance" do
    contractor1.interests.create(job: cabinet_job)
    contractor1.interests[0].bids.create(price: 5500)
    contractor1.interests.create(job: another_cabinet_job)
    contractor1.interests[1].bids.create(price: 2200)
    cabinet_job.lowest_bid.winner!
    another_cabinet_job.lowest_bid.winner!
    cabinet_job.completed!
    expect(contractor1.portfolio.jobs.length).to eql 1
  end
end
