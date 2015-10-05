class Patient < ActiveRecord::Base
  belongs_to :health_plan

  validates :patient, presence: true
  validates :birth, presence: true
  validates :marital_status_id, presence: true
  validates :email, presence: true
end