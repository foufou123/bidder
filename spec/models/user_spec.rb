require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user1) { FactoryGirl.create(:job_creator) }
  let(:user2) { FactoryGirl.create(:contractor_user) }
  let(:user3) { FactoryGirl.create(:competitor_user) }
  let(:contractor1) { user2.build_contractor(
    organization_type: 'Cabinetry', organization_name: 'Cabinets Co.', summary: 'We build quality cabinets.')
  }
  let(:contractor2) { user3.build_contractor(
    organization_type: 'Cabinetry', organization_name: 'Shoddy Co.', summary: 'We build quickly and bounce!')
  }
  let(:job1) { user1.jobs.build(name: 'Kitchen Cabinets', category: 'Cabinetry', description: 'Install custimized kitchen cabinets') }
  let(:interest1) { contractor1.interests.build(job: job1) }
  let(:interest2) { contractor2.interests.build(job: job1) }

  it "should initialize a User" do
    expect(user1).to be_an_instance_of User
    expect(user2).to be_an_instance_of User
  end

  it "should create a Job" do
    user1.jobs.build(name: 'jobby', category: 'string', description: 'Install kithen cabinets');
    expect(user1.jobs.first).to be_an_instance_of Job
  end

  it "should create Contractor profile" do
    ##! user.build_another_model is used for has_one relationships (Instead of user.contractors.build).
    ##! Perfect for building profiles like Contractor
    user2.build_contractor(organization_type: 'Pool', organization_name: 'Pool Time', summary: 'We install custom pools');
    expect(user2.contractor.organization_type).to eql 'Pool'
    expect(user2.contractor).to be_an_instance_of Contractor
  end

  it "should be a Job" do
    expect(job1).to be_an_instance_of Job
  end

  it "creates a Bid by Contractor Interest" do
    bid = interest1.bids.build(price: 6500)
    expect(bid).to be_valid
    expect(contractor1.interests.first.bids.first.price).to eql 6500
  end

  it "Associates Interest with it's Job" do
    expect(interest1.job.name).to eql 'Kitchen Cabinets'
    expect(contractor1.interests.length).to eql 1
  end

  #it "should find Interest" do
  #  interest = contractor1.interests.find_by(job: job1)
  #  expect(interest).to be_an_instance_of Interest
  #end

  #it "should have 1 Job" do
  #  expect(user1.jobs.first.name).to eql 'Kitchen Cabinets'
  #end

#  it "creates a Bid war" do
#    #contractor1.bids.build(price: 6500, job: job1)
#    #contractor2.bids.build(price: 6000, job: job1)
#    job1.bids.build(price: 6500, contractor: contractor1)
#    job1.bids.build(price: 6000, contractor: contractor2)
#    expect(job1.bids.length).to eql 2
#    expect(contractor1.bids.length).to eql 1
#  end
end
