require 'rails_helper'

RSpec.describe Interest, type: :model do
  let(:user1) { FactoryGirl.create(:job_creator) }
  let(:user2) { FactoryGirl.create(:contractor_user) }
  let(:user3) { FactoryGirl.create(:competitor_user) }
  let(:contractor1) { FactoryGirl.create(:good_contractor) }
  let(:contractor2) { FactoryGirl.create(:competitor_contractor) }
  let(:cabinet_job) { FactoryGirl.create(:cabinet_job) }
  let(:interest1) { FactoryGirl.create(:good_interest) }
  let(:interest2) { FactoryGirl.create(:competitor_interest) }

  it "should be an instance of Interest" do
    expect(interest1).to be_an_instance_of Interest
  end

  it "should create instances" do
    cabinet_job.interests.build(contractor: contractor1).save
    cabinet_job.interests.build(contractor: contractor2).save
    expect(cabinet_job.interests.length).to eql 2
  end

  it "should be invalid when Job and Contractor are not unique" do
    valid_interest = cabinet_job.interests.create(contractor: contractor1)
    invalid_interest = cabinet_job.interests.create(contractor: contractor1)
    false_interest = cabinet_job.interests.build(contractor: contractor1).save
    expect(valid_interest).to be_an_instance_of Interest
    expect(valid_interest).to be_valid
    expect(invalid_interest).to be_invalid
    expect(false_interest).to eql false
  end
end
