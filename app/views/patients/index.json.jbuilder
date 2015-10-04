json.array!(@patients) do |patient|
  json.extract! patient, :id, :patient, :birth, :nationality, :marital_status_id, :indication_patient, :health_plan_id, :email
  json.url patient_url(patient, format: :json)
end
