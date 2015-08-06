require 'rails_helper'

RSpec.describe SkillSet, type: :model do
  let(:user1) { FactoryGirl.create(:job_creator) }
  let(:user2) { FactoryGirl.create(:contractor_user) }
  let(:user3) { FactoryGirl.create(:competitor_user) }
  let(:contractor1) { FactoryGirl.create(:good_contractor) }
  let(:contractor2) { FactoryGirl.create(:competitor_contractor) }
  let(:cabinet_job) { FactoryGirl.create(:cabinet_job) }
  let(:another_cabinet_job) { FactoryGirl.create(:another_cabinet_job) }
  let(:interest1) { FactoryGirl.create(:good_interest) }
  let(:interest2) { FactoryGirl.create(:competitor_interest) }

  let(:skill_tag1) { FactoryGirl.create(:cabinetry_tag) }
  let(:skill_tag2) { FactoryGirl.create(:table_saw_tag) }
  let(:skill_tag3) { FactoryGirl.create(:staining_tag) }

  it "should have an instance and belong to Contractor" do
    expect(contractor1.skill_set).to be_valid
    expect(contractor1.skill_set).to be_an_instance_of SkillSet
  end

  describe "#skills.create" do
    it "should create Skills from SkillTags" do
      contractor1.skill_set.skills.create(skill_tag: skill_tag1, years: 10, proficiency: 8)
      contractor1.skill_set.skills.create(skill_tag: skill_tag2, years: 14, proficiency: 10)
      contractor1.skill_set.skills.create(skill_tag: skill_tag3, years: 12, proficiency: 9)
      expect(contractor1.skill_set.skills.length).to eql 3
    end
  end
end
