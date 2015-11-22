json.array!(@materials) do |material|
  json.extract! material, :id, :measurement_id, :code, :name, :note, :minimal
  json.url material_url(material, format: :json)
end
