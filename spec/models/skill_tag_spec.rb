require 'rails_helper'

RSpec.describe SkillTag, type: :model do
  let(:skill_tag1) { FactoryGirl.create(:cabinetry_tag) }

  it "should be a valid instance" do
    expect(skill_tag1).to be_an_instance_of SkillTag
    expect(skill_tag1.name).to eql 'Cabinetry'
  end
end
