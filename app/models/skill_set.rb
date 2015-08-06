class SkillSet < ActiveRecord::Base
  belongs_to :contractor
  has_many   :skills
end
