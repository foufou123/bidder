require 'rails_helper'

RSpec.describe Contractor, type: :model do
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
    user2.build_contractor(organization_type: 'Aquatics',
                           organization_name: 'Pool Time Inc.',
                           summary: '20 years of Pool Installation experience')
      .save
    expect(user2.contractor).to be_an_instance_of Contractor
    expect(contractor2).to be_an_instance_of Contractor
  end

  describe "self.interests.build" do
    it "may create interests to many jobs" do
      contractor1.interests.create(job: cabinet_job)
      contractor1.interests.create(job: another_cabinet_job)
      expect(contractor1.interests.length).to eql 2
    end
  end

  describe "#bids" do
    it "should create bids through Interests" do
      contractor1.interests.create(job: cabinet_job)
      contractor1.interests.create(job: another_cabinet_job)
      contractor1.interests[0].bids.create(price: 6500)
      contractor1.interests[1].bids.create(price: 1500)
      expect(contractor1.interests[0].bids.length).to eql 1
      expect(contractor1.bids.length).to eql 2
      expect(cabinet_job.bids.length).to eql 1
      expect(cabinet_job.bids[0].interest.contractor).to eql contractor1
    end
  end

  it "can have multiple Contracts" do
    contractor1.interests.create(job: cabinet_job)
    contractor1.interests.create(job: another_cabinet_job)
    contractor1.interests[0].bids.create(price: 6500)
    contractor1.interests[1].bids.create(price: 1500)
    cabinet_job.lowest_bid.winner!
    another_cabinet_job.lowest_bid.winner!
    expect(contractor1.contracts.length).to eql 2
  end
end
