json.array!(@legacies) do |legacy|
  json.partial! "legacies/legacy.json.jbuilder", legacy: legacy
end
