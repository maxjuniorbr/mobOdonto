class Patient < ActiveRecord::Base
  belongs_to :health_plan
  has_many :addresses
  accepts_nested_attributes_for :addresses, allow_destroy: true

  validates :patient, presence: true
  validates :birth, presence: true
  validates :marital_status_id, presence: true
  validates :email, presence: true

  def tags_for_form
    collection = addresses.where(patient_id: id)
    collection.any? ? collection : addresses.build
  end  
end