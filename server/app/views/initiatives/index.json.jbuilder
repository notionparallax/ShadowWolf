json.array!(@initiatives) do |initiative|
  json.partial! "initiatives/initiative.json.jbuilder", initiative: initiative
end
