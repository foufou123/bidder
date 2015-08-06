class Skill < ActiveRecord::Base
  belongs_to :skill_tag
  belongs_to :skill_set
end
