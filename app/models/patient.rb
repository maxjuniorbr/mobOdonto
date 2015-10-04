class Patient < ActiveRecord::Base
  belongs_to :health_plan

  validates :patient, presence: true
end
