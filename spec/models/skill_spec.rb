require 'rails_helper'

RSpec.describe Skill, type: :model do
  let(:contractor1) { FactoryGirl.create(:good_contractor) }
  let(:contractor2) { FactoryGirl.create(:competitor_contractor) }
  let(:cabinet_job) { FactoryGirl.create(:cabinet_job) }
  let(:another_cabinet_job) { FactoryGirl.create(:another_cabinet_job) }
  let(:interest1) { FactoryGirl.create(:good_interest) }
  let(:interest2) { FactoryGirl.create(:competitor_interest) }

  let(:skill_tag1) { FactoryGirl.create(:cabinetry_tag) }
  let(:skill_tag2) { FactoryGirl.create(:table_saw_tag) }
  let(:skill_tag3) { FactoryGirl.create(:staining_tag) }

  let(:skill1) { contractor1.skill_set.skills.build(skill_tag: skill_tag1, years: 5, proficiency: 7) }

  it "should be a valid instance" do
    expect(skill1).to be_an_instance_of Skill
  end
end
