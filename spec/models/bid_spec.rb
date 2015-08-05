require 'rails_helper'

RSpec.describe Bid, type: :model do
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
    job, contractor = interest1.job, interest1.contractor
    bid1 = interest1.bids.create(price: 5000)
    expect(bid1).to be_an_instance_of Bid
    expect(interest1.bids.length).to eql 1
    expect(job.bids.length).to eql 1
    expect(contractor.bids.length).to eql 1
    expect(job.bids.first).to eql contractor.bids.first
  end

  describe "#winner!" do
    it "should create a Contract" do
      job, contractor = interest1.job, interest1.contractor
      bid1 = interest1.bids.create(price: 5000)
      bid1.winner!
      expect(job.contract).to eql contractor.contracts.first
    end
  end
end
