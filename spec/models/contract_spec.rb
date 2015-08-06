require 'rails_helper'

RSpec.describe Contract, type: :model do
  let(:user1) { FactoryGirl.create(:job_creator) }
  let(:user2) { FactoryGirl.create(:contractor_user) }
  let(:user3) { FactoryGirl.create(:competitor_user) }
  let(:contractor1) { FactoryGirl.create(:good_contractor) }
  let(:contractor2) { FactoryGirl.create(:competitor_contractor) }
  let(:cabinet_job) { FactoryGirl.create(:cabinet_job) }
  let(:interest1) { FactoryGirl.create(:good_interest) }
  let(:interest2) { FactoryGirl.create(:competitor_interest) }

  it "should be valid" do
    cabinet_job.interests.create(contractor: contractor1)
    cabinet_job.interests.create(contractor: contractor2)
    cabinet_job.interests[0].bids.create(price: 6500)
    cabinet_job.interests[1].bids.create(price: 6000)
    cabinet_job.interests[0].bids.create(price: 5500)
    #expect(cabinet_job.contract).to eql nil
    cabinet_job.lowest_bid.winner!
    expect(cabinet_job.contract).to be_an_instance_of Contract
    expect(contractor1.contracts.length).to eql 1
    expect(cabinet_job.contract).to eql contractor1.contracts.first
    expect(cabinet_job).to eql contractor1.contracts.first.job
  end
end
