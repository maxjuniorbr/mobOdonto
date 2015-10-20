json.array!(@phones) do |phone|
  json.extract! phone, :id, :patient_id, :landline_phone, :cell_phone, :business_phone, :other_phone, :other_phone_contact
  json.url phone_url(phone, format: :json)
end
