require 'rails_helper'

RSpec.describe Job, type: :model do
  let(:user1) { FactoryGirl.create(:job_creator) }
  let(:user2) { FactoryGirl.create(:contractor_user) }
  let(:user3) { FactoryGirl.create(:competitor_user) }
  let(:contractor1) { FactoryGirl.create(:good_contractor) }
  let(:contractor2) { FactoryGirl.create(:competitor_contractor) }
  let(:cabinet_job) { FactoryGirl.create(:cabinet_job) }

  it "should be valid" do
    job = user1.jobs.build(name: "Need Custom Cabinets", category: "Cabinetry", description: "Custom built kitchen cabinets")
    expect(job).to be_an_instance_of Job
    expect(job).to be_valid
    expect(user1.jobs.length).to eql 1
    expect(user1.jobs.first.name).to eql "Need Custom Cabinets"
  end

  it "is created from Factory" do
    expect(cabinet_job).to be_an_instance_of Job
    expect(cabinet_job.user.email).to eql "mycabinetsneedfixing@example.com"
  end

  it "should have an Interest from Contractor" do
    cabinet_job.interests.create(contractor_id: contractor1.id)
    expect(cabinet_job.interests.length).to eql 1
    expect(contractor1.interests.length).to eql 1
    expect(cabinet_job.interests.first).to be_valid
    expect(contractor1.interests.first).to be_valid
    expect(cabinet_job.interests.first).to eql contractor1.interests.first
    expect(contractor1.interests.first.job).to eql cabinet_job
  end

  describe "#bids.first#winner!" do
    it "should create a Contract between User's Job and Contractor" do
      job_creator = cabinet_job.user
      interest = cabinet_job.interests.create(contractor: contractor1)
      interest.bids.create(price: 6500)
      expect(interest.bids.first.price).to eql 6500
      expect(cabinet_job.bids.first.price).to eql 6500
      expect(contractor1.interests.first.bids.first.price).to eql 6500
      expect(job_creator.jobs.first.bids.first.price).to eql 6500

      job_creator.jobs.first.bids.first.winner!
      expect(job_creator.jobs.first.contract).to be_an_instance_of Contract
      expect(job_creator.jobs.first.contract.contractor.organization_name).to eql "Awesome Cabinets Co"
      expect(contractor1.contracts.length).to eql 1
      expect(contractor1.contracts.first.job).to eql cabinet_job
      expect(job_creator.jobs.first).to eql contractor1.contracts.first.job
    end
  end

  describe "#lowest_bid" do
    it "should return Bid with lowest price" do
      cabinet_job.interests.create(contractor: contractor1)
      cabinet_job.interests.create(contractor: contractor2)
      contractor1.interests.first.bids.create(price: 6500)
      contractor2.interests.first.bids.create(price: 6000)
      lowest_bid = contractor1.interests.first.bids.create(price: 5500)
      expect(cabinet_job.lowest_bid).to eql lowest_bid
      expect(lowest_bid.interest.contractor).to eql contractor1
      expect(cabinet_job.lowest_bid.interest.contractor).to eql contractor1
    end
  end

end
