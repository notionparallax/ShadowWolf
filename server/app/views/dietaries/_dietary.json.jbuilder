json.id dietary.id
json.extract! dietary, :created_at, :updated_at, :requirements
json.preference do
  json.partial! "app/views/preferences/preference.json.jbuilder", preference: dietary.preference
end if dietary.preference
