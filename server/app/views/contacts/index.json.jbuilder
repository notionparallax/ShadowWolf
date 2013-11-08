json.array!(@contacts) do |contact|
  json.partial! "contacts/contact.json.jbuilder", contact: contact
end
