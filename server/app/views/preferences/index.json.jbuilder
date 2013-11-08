json.array!(@preferences) do |preference|
  json.partial! "preferences/preference.json.jbuilder", preference: preference
end
