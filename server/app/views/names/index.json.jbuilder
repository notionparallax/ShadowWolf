json.array!(@names) do |name|
  json.partial! "names/name.json.jbuilder", name: name
end
