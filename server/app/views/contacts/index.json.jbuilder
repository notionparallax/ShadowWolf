json.array!(@contacts) do |contact|
  json.extract! contact, :extension, :studio
  json.url contact_url(contact, format: :json)
end
