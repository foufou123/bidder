require 'rails_helper'

RSpec.describe Contact, type: :model do
  let(:user1) { FactoryGirl.create(:job_creator) }
  let(:user2) { FactoryGirl.create(:contractor_user) }
  let(:user3) { FactoryGirl.create(:competitor_user) }
  let(:contractor1) { FactoryGirl.create(:good_contractor) }
  let(:contractor2) { FactoryGirl.create(:competitor_contractor) }
  let(:cabinet_job) { FactoryGirl.create(:cabinet_job) }

  it "should be a valid instance" do
    expect(user3.contact).to be_an_instance_of Contact
    expect(contractor1.contact).to be_an_instance_of Contact
    expect(cabinet_job.contact).to be_an_instance_of Contact
  end
end
