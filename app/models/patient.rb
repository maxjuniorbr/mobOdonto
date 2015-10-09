class Patient < ActiveRecord::Base
  belongs_to :health_plan
  has_many :addresses
  accepts_nested_attributes_for :addresses, allow_destroy: true

  validates :patient, presence: true
  validates :birth, presence: true
  validates :marital_status_id, presence: true

  def tags_for_form
    collection = addresses.where(patient_id: id)
    collection.any? ? collection : addresses.build
  end

  def self.terms_for(prefix)
    patients = where("upper(patient) like ?", "%#{prefix.upcase}%")
    patients.order("patient desc").limit(10)
  end

  def self.list_with_indication_name
    select('patients.id, patients.patient, patients.birth, patients.nationality, patients.marital_status_id, patients.indication_patient_id, p.patient indication_patient_name, patients.health_plan_id, patients.email').joins('LEFT JOIN patients p ON p.id = patients.indication_patient_id').all
  end

  def self.edit_with_indication_name(id)
    select('patients.id, patients.patient, patients.birth, patients.nationality, patients.marital_status_id, patients.indication_patient_id, p.patient indication_patient_name, patients.health_plan_id, patients.email').joins('LEFT JOIN patients p ON p.id = patients.indication_patient_id').find(id)
  end
end