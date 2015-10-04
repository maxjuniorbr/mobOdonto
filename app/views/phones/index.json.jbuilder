json.array!(@phones) do |phone|
  json.extract! phone, :id, :number, :contact_name, :phone_type, :customer_id
  json.url phone_url(phone, format: :json)
end
