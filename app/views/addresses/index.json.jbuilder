json.array!(@addresses) do |address|
  json.extract! address, :id, :patient_id, :street, :street_number, :complement, :neighborhood, :zip, :city_id
  json.url address_url(address, format: :json)
end
